             PGM
/*********************************************************************/
/* Change this VALUE, to build FROM a different Release VxRxMx       */
             DCL        VAR(&RELEASE) TYPE(*CHAR) LEN(10) +
                          VALUE('CURRENTSRC')
/*********************************************************************/
/* Change this VALUE, to build FROM a different source library       */
             DCL        VAR(&LIBSRC) TYPE(*CHAR) LEN(10) +
                          VALUE('DVBBS400')
/*********************************************************************/
/* Change this VALUE, to build INTO a different Library              */
             DCL        VAR(&LIBOBJ) TYPE(*CHAR) LEN(10) +
                          VALUE('PBBS400OBJ')
             DCL        VAR(&LIBDTA) TYPE(*CHAR) LEN(10) +
                          VALUE('PBBS400DTA')
/*********************************************************************/
/* Remove LIBS from Library List Entry                               */
             RMVLIBLE   LIB(&LIBOBJ)
             MONMSG     MSGID(CPF2110) /* LIB doesn't exist */
             MONMSG     MSGID(CPF2104) /* LIB isn't in the LIBLE */
             RMVLIBLE   LIB(&LIBDTA)
             MONMSG     MSGID(CPF2110) /* LIB doesn't exist */
             MONMSG     MSGID(CPF2104) /* LIB isn't in the LIBLE */
/*********************************************************************/
/* Delete existing destination libraries                             */
             DLTLIB     LIB(&LIBOBJ)
             MONMSG     MSGID(CPF2110) /* LIB doesn't exist */
             DLTLIB     LIB(&LIBDTA)
             MONMSG     MSGID(CPF2110) /* LIB doesn't exist */
/*********************************************************************/
/* Re-create destination libraries                                   */
             CRTLIB     LIB(&LIBOBJ) TEXT('BBS400''s Objects')
             CRTLIB     LIB(&LIBDTA) TEXT('BBS400''s Data')
/*********************************************************************/
/* Add LIBS to Library List Entry                                    */
             ADDLIBLE   LIB(&LIBOBJ) POSITION(*FIRST)
             MONMSG     MSGID(CPF2103) /* LIB already in LIBLE */
             ADDLIBLE   LIB(&LIBDTA) POSITION(*FIRST)
             MONMSG     MSGID(CPF2103) /* LIB already in LIBLE */
/*********************************************************************/
/* Compile PNLGRP files                                              */
        CRTPNLGRP  PNLGRP(&LIBOBJ/BBSHELPPNL) SRCFILE(&LIBSRC/&RELEASE)
/*********************************************************************/
/* Compile PF files                                                  */
          CRTPF      FILE(&LIBDTA/PACCLVS) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PBOARDS) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PCONFIG) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PEXTPGMS) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PIFSFILES) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PINVALNICK) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PLOGGED) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PMESSGS) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PPOLLSA) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PPOLLSQ) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PSBORDS) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PSESSIONS) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PUSERS) SRCFILE(&LIBSRC/&RELEASE)
          CRTPF      FILE(&LIBDTA/PUUMSGS) SRCFILE(&LIBSRC/&RELEASE)
/*********************************************************************/
/* Compile LF files                                                  */
          CRTLF      FILE(&LIBDTA/LLOGGED) SRCFILE(&LIBSRC/&RELEASE)
          CRTLF      FILE(&LIBDTA/LMESSGS) SRCFILE(&LIBSRC/&RELEASE)
          CRTLF      FILE(&LIBDTA/LMESSGSUID) SRCFILE(&LIBSRC/&RELEASE)
          CRTLF      FILE(&LIBDTA/LSESSIONS) SRCFILE(&LIBSRC/&RELEASE)
          CRTLF      FILE(&LIBDTA/LUSERS) SRCFILE(&LIBSRC/&RELEASE)
          CRTLF      FILE(&LIBDTA/LUUMSGSRCP) SRCFILE(&LIBSRC/&RELEASE)
/*********************************************************************/
/* Compile DSPF files                                                */
          CRTDSPF    FILE(&LIBOBJ/BBSAACCLVD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSADBLD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSADGCD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSADMMNUD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSADNUDFD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSAEPGMMD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSBRDLD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSETPGMSD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSIFSFILD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSINFD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSLGIND) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSLSTUSRD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSMENUD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSMSGSD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSMSGSLLD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSNEWMSGD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSPOLLSLD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSRDMSGD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSRDU2UMD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSSBRLD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSSYSINFD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSUSROPTD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSWELCD) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSWINASKW) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSWINSBSW) SRCFILE(&LIBSRC/&RELEASE)
          CRTDSPF    FILE(&LIBOBJ/BBSWINYNW) SRCFILE(&LIBSRC/&RELEASE)
/*********************************************************************/
/* Compile RPGILE files                                              */
          CRTBNDRPG  PGM(&LIBOBJ/BBSAACCLVR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSADGCR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSADMMNUR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSADNUDFR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSAEPGMMR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSBRDLR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSETPGMSR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSIFSFILR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSLGINR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSLSTUSRR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSMENUR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSMSGSR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSNEWMSGR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSNEWREGR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSPOLLSLR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSRDMSGR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSRDU2UMR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSSBRLR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSSOTEXPR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSUSROPTR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSWINASKR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSWINSBSR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/BBSWINYNR) SRCFILE(&LIBSRC/&RELEASE)
          CRTBNDRPG  PGM(&LIBOBJ/GETMD5HASH) SRCFILE(&LIBSRC/&RELEASE)
/*********************************************************************/
/* Compile SQLRPGLE files                                            */
          CRTSQLRPGI OBJ(&LIBOBJ/BBSMSGSLLR) SRCFILE(&LIBSRC/&RELEASE)
/*********************************************************************/
/* Compile CLP files                                                 */
          CRTCLPGM   PGM(&LIBOBJ/BBSDSPIFSC) SRCFILE(&LIBSRC/&RELEASE)
          CRTCLPGM   PGM(&LIBOBJ/BBSHELPERC) SRCFILE(&LIBSRC/&RELEASE)
          CRTCLPGM   PGM(&LIBOBJ/BBSINFC) SRCFILE(&LIBSRC/&RELEASE)
          CRTCLPGM   PGM(&LIBOBJ/BBSSYSINFC) SRCFILE(&LIBSRC/&RELEASE)
          CRTCLPGM   PGM(&LIBOBJ/BBSWELCC) SRCFILE(&LIBSRC/&RELEASE)
          CRTCLPGM   PGM(&LIBOBJ/BBS400) SRCFILE(&LIBSRC/&RELEASE)
/*********************************************************************/
/* Initialise Databases                                              */
             RUNSQLSTM  SRCFILE(&LIBSRC/&RELEASE) SRCMBR(INITDBS) +
                          COMMIT(*NONE)
/*********************************************************************/
/* Remove LIBS from Library List Entry                               */
             RMVLIBLE   LIB(&LIBOBJ)
             RMVLIBLE   LIB(&LIBDTA)

             ENDPGM
