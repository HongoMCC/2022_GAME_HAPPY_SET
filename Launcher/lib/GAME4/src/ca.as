#module
    #deffunc ca int rule_code, int cell_size, int is_rand, int boundary_condition
        randomize

        /*���[���̐���
        2��cnt��̃r�b�g��1�Ȃ�z��̑Ή�����ӏ���1����
        ������int�ł��锤�̃��m���r�b�g���Ƃɐ؂�o���Ĕz��ɂ���*/
        dim rule, 8
        repeat 8
            if rule_code and int(powf(2,cnt)) : rule(cnt) = 1
        loop

        /*��ԑJ�ڂƕ\��
        �Ȃ�Ƃ������Ȃ��̂Œ��s�������*/
        size = ginfo_winx / cell_size
        height = ginfo_winy / cell_size

        dim cells, size

        //�^�񒆂�1��u��
        cells(int(size/2)) = 1

        //�����_����
        if is_rand {
            repeat size
                cells(cnt) = rnd(2)
            loop
        }

        //���̃Z���̏�Ԃ�\���z��
        dim tmp, size
        //���݂̕\�����W
        x = 0 : y = 0

        repeat height
            redraw 0
                x = 0
                
                //�[�_�̏���
                switch boundary_condition
                    case 0
                        //�����I���E����
                        cells(0) = cells(size-2)
                        cells(size-1) = cells(1)
                        swbreak
                    case 1
                        //�Œ�I���E����(0)
                        cells(0) = 0
                        cells(size - 1) = 0
                        swbreak
                    case 2
                        //�Œ�I���E����(1)
                        cells(0) = 1
                        cells(size - 1) = 1
                        swbreak
                    case 3
                        //���˓I���E����
                        cells(0) = cells(1)
                        cells(size - 1) = cells(size - 2)
                        swbreak
                    case 4
                        //�U��I���E����
                        cells(0) = rnd(2)
                        cells(1) = rnd(2)
                        swbreak
                swend
                
                repeat size - 2, 1
                    //�o��
                    ;mes cells(cnt),1
                    if cells(cnt) == 0 {
                        color 255, 255, 255
                    } else : cells(cnt) == 1 {
                        color 0, 0, 0
                    }
                    boxf x * cell_size, y * cell_size, x * cell_size + cell_size, y * cell_size + cell_size
                    //���݂̃Z���Ɨ��ׂƂ𔲂��o���Đ��ɂ��A���[������Ή�����0������1�����̏�Ԃɑ��
                    tmp(cnt) = rule((cells(cnt - 1) * 4) + (cells(cnt) * 2) + (cells(cnt+1) * 1))
                    x += 1
                loop
                repeat size - 2, 1
                    //�������݂ɂȂ�
                    cells(cnt) = tmp(cnt)
                loop
                //y���W��1�𑫂�
                y += 1
            redraw 1
            await 1
        loop
        return
#global

//ca 30, 1, 0, 0