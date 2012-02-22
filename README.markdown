# CL-HAML

## What is CL-HAML?

[Haml](http://haml-lang.com/ "Haml")���̋L�@������ Common Lisp�pHTML�W�F�l���[�^�ł��B�C���f���g��ȗ��\���ɂ���ĊȌ��ȋL�q���s���܂��B

Common Lisp�ɂ́AS����HTML�ɕϊ����郉�C�u�������L�x�ɑ��݂��܂����A���̑��̕����̃��C�u�����͂��܂芈���ł͂Ȃ��̂ł́H�Ɗ����܂����BS���͐l�ނ̔��������ł��D�ꂽ�L�q���@�ł����A�c�O�Ȃ���f�U�C�i�ɂ͏��X�~���������悤�ł�(�f�U�C�i�� Emacs���g�p���Ȃ��̂�)�B�Ȃ̂ŁACL-HAML�����܂���! CL-HAML�́A�f�U�C�i�ɂ� Lisper�ɂ� �����ɂ����C�͂��܂��B�ł��A�{��Haml��������f�U�C�i������̂ő��v�ł��A�����ƁB

���ӁF��ϐ\���󂠂�܂��񂪁A�܂��܂������ɂ͒������A�G���[���b�Z�[�W���s�e�؂�������A�����o�O���c���Ă����肵�܂��B

����ł������Ă�����������A�o�O�̘A���� ���P�̒�Ă�����������Ɗ������ł��B

## Install

���݁ACL-HAML�� QuickLisp�ɑΉ����Ă��܂���B
[github�̃��|�W�g��](https://github.com/Unspeakable/cl-haml)����擾���Ă��������B

## Execute

    CL-USER> (ASDF:LOAD-SYSTEM :CL-HAML)
    CL-USER> (CL-HAML:EXECUTE-HAML (MERGE-PATHNAMES
                                      "test/test-haml/test-02.haml"
                                      (ASDF:SYSTEM-SOURCE-DIRECTORY :CL-HAML))
                                   '(:NAME "INUZINI-JIRO"
                                     :AGE  28))

