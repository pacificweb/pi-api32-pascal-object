unit pi-api32;

{Cross reference api declaration from }
{Visual Basic PIAPI32.BAS TO Delphi unit pi-api32.pas}
{Donator : Mike Noordermeer in year 2003}

interface

const
  ARCTOTAL = 0;
  ARCMINIMUM = 1;
  ARCMAXIMUM = 2;
  ARCSTDEV = 3;
  ARCRANGE = 4;
  ARCAVERAGE = 5;
  ARCMEAN = 6;

  //------------------------------- piar_value definitions
  ARCVALUEBEFORE = 1;
  ARCVALUEAFTER = 2;
  ARCVALUEINTERP = 3;
  ARCVALUECODE = 4;

  //------------------------------- piel_evntactn definitions
  ELEQSEARCH = 1;
  ELGESEARCH = 2;
  ELLESEARCH = 3;
  ELGTSEARCH = 4;
  ELLTSEARCH = 5;
  ELEDIT = 6;
  ELDELETE = 7;

  //------------------------------- pilg_putoutput definitions
  MSGLOG = 1;
  STDOUTPUT = 2;

  //------------------------------- pipt_updates definitions
  NOTAGS = 0;
  POINTCREATE = 1;
  POINTEDIT = 2;
  POINTDELETE = 3;

  //------------------------------- piut_login definitions
  PILOGINOK = 1;
  PIREADACCESS = 2;
  PIWRITEACCESS = 4;
  PILOGINREAD = 8;
  PILOGINWRITE = 16;
  PILOGINPIUSER = 256;
  PILOGINVMS = 512;
  PILOGINUNIX = 1024;
  PINO = 0;
  PIREAD = 1;
  PIREADWRITE = 2;

  //-------------------------------- pilg definitions
  GETFIRST = 0;
  GETNEXT = 1;
  GETSAME = 2;
  PI_NOMOREVALUES = 100;   
  PI_M_AFLAG = 1;           
  PI_M_QFLAG = 2;           
  PI_M_SFLAG = 4;           
  MAX_POINT_NUM_LEN = 16;
  MAX_NODENAME_LEN = 30;
  MAX_TAGNAME_LEN = 256;
  MAX_USERNAME_LEN = 30;
  PILOGIN_SERVER_TYPE_PI = 1000;

  //-------------------------------- extended API definitions
  ARCflag_time = 4;          
  ARCFLAG_EVEN = 8;
  ARCflag_filter = 16;       
  ARCflag_mark = 32;         
  ARCFLAG_COMP = 64;
  PI_Type_null = 0;
  PI_Type_bool = 1;
  PI_Type_uint8 = 2;
  PI_Type_int8 = 3;
  PI_Type_char = 4;
  PI_Type_uint16 = 5;
  PI_Type_int16 = 6;
  PI_Type_uint32 = 7;
  PI_Type_int32 = 8;
  PI_Type_uint64 = 9;
  PI_Type_int64 = 10;
  PI_Type_float16 = 11;
  PI_Type_float32 = 12;
  PI_Type_float64 = 13;
  PI_Type_PI2 = 14;
//  PI_Type_PIobject = 100;      
  PI_Type_digital = 101;
  PI_Type_blob = 102;
//  PI_Type_PIvalue = 103;       
//  PI_Type_PItimestamp = 104;   
  PI_Type_PIstring = 105;
//  PI_Type_PIpoint = 106;       
//  PI_Type_PIstatus = 107;      
//  PI_Type_PInametable = 108;   
//  PI_Type_PIstrlist = 109;     
//  PI_Type_PIptclasses = 110;   
//  PI_Type_PIevent = 111;       
//  PI_Type_PIeventlst = 112;    
//  PI_Type_PIint16array = 113;  
//  PI_Type_PIint32array = 114;  
//  PI_Type_PIfloat32array = 115;
//  PI_Type_PIvaluearray = 116;  
//  PI_Type_PIstrtable = 117;    
//  PI_Type_PIusertoken = 118;   
//  PI_Type_PIeventswid = 119;   
  PI_Type_bad = 255;

// piar_putarcvaluesx defines
  ARCNOREPLACE = 3;   //' add unless event(s) exist at same time (PI 2.x)
  ARCAPPEND = 4;      //' add event regardless of existing events
  ARCREPLACE = 5;     //' add event, replace if event at same time
  ARCREPLACEX = 6;    //' replace existing event (fail if no event at time)
  ARCDELETE = 7;      //' remove existing event
  ARCAPPENDX = 8;     //' add event regardless of existing events, no compression


//---------------------------- Structure declarations

MAXPI3PUTSNAP = 255; // For queue call return values.

type
  QERROR = record
    point: Longint;
    piapierror: Longint;
  end;

  QERRORS = record
    syserror: Longint;
    numpterrs: Longint;
    qerr: Array[0..MAXPI3PUTSNAP] of QERROR; 
  end;

  PI_VAL = record             
    bSize: Longint;           
    iStat: Longint;           
    Flags: Smallint;          
  end;

  PI_EXCEPT = record
    newval: Single;
    newstat: Longint;
    newtime: Longint;
    oldval: Single;
    oldstat: Longint;
    oldtime: Longint;
    prevval: Single;
    prevstat: Longint;
    prevtime: Longint;
    excdeveng: Single;
    excmin: Longint;
    excmax: Longint;
  end;

  TAGLIST = record
    server: String;    // As String * MAX_NODENAME_LEN
    nodeid: Longint;
    tagname: String;   // As String * MAX_TAGNAME_LEN
    point: Longint;
    reserved: Longint;
  end;

  PITimeStamp = record
    month: Longint;     // 1-12
    year: Longint;      // four digit
    day: Longint;       // 1-31
    hour: Longint;      // 0-23
    minute: Longint;    // 0-59
    tzinfo: Longint;    // 
    second: Double;     // 0-59.99999999....
  end;

// PI batch function declarations -- New with PI-API v1.1.0
Function piba_getunit(piunit: PChar; slen, index, number: Longint): Longint; stdcall; external 'piapi32.dll';
Function piba_getaliaswunit(piunit, balias: PChar; slen, index, number: Longint): Longint; stdcall; external 'piapi32.dll';
Function piba_getunitswalias(balias, piunit: PChar; slen, index, number: Longint): Longint; stdcall; external 'piapi32.dll';
Function piba_findaliaspoint(piunit, balias: PChar; ptno: Longint; tagname: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function piba_search(batchid: PChar; blen: Longint; piunit: PChar; ulen: Longint; product: PChar; plen, stime, etime, sf, timeout: Longint): Longint; stdcall;external 'piapi32.dll';

// PI Login Services function declarations -- new with PI-API v1.1.0
Function pilg_addnewserver(servername: PChar; servertype: Longint; username: PChar; portnum: Longint): Longint; stdcall; external 'pilog32.dll';
Function pilg_connectdlg(hwndparent: Integer): Longint; stdcall; external 'pilog32.dll';
Function pilg_disconnect: Longint;  stdcall; external 'pilog32.dll';
Function pilg_disconnectnode(servername: PChar): Longint;  stdcall; external 'pilog32.dll';
Function pilg_getconnectedserver(servernamebuf: PChar; bufsize, nodeid, port, seq: Longint): Longint;  stdcall; external 'pilog32.dll';
Function pilg_getdefserverinfo(servernamebuf: PChar; bufsize, nodeid, port: Longint): Longint;  stdcall; external 'pilog32.dll';
Function pilg_getnodeid(servernamebuf: PChar; nodeid: Longint): Longint;  stdcall; external 'pilog32.dll';
Function pilg_getselectedtag(taglst: TAGLIST; seq: Longint): Longint;  stdcall; external 'pilog32.dll';
Function pilg_getservername(nodeid: Longint; servernamebuf: PChar; bufsize: Longint): Longint; stdcall; external 'pilog32.dll';
Function pilg_login(hwndparent: Integer; username, servername, password: PChar; valid: Longint): Longint; stdcall; external 'pilog32.dll';
Function pilg_pointattdlg(hwndparent: Integer; taglst: TAGLIST): Longint; stdcall; external 'pilog32.dll';
Function pilg_registerapp(dllname: PChar): Longint; stdcall; external 'pilog32.dll';
// The function below requires allocating a linked list which is not supported in VB '
// Declare Function pilg_registerhelp(helpfile: PChar; linklist: Longint): Longint; far; external 'pilog32.dll';
Function pilg_setservernode(servername: PChar): Longint; stdcall; external 'pilog32.dll';
Function pilg_tagsearchdlg(hwndparent: Integer): Longint; stdcall; external 'pilog32.dll';
Function pilg_unregisterapp: Longint; stdcall; external 'pilog32.dll';

// Function declarations
Function piar_calculation(count, times: Longint; rvals: Single; istats: Longint; expr: PChar): Longint; stdcall; external 'piapi32.dll';
Function piar_compvalues(pt, count, times: Longint; rvals: Single; istats, rev: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_compvaluesfil(pt: Longint; count: Pointer; times: Pointer; rvals: Pointer; istats: Pointer; expr: PChar; rev, fil: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_deletevalue(pt, timedate: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_interpvalues(pt, count, times: Longint; rvals: Single; istats: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_interpvaluesfil(pt, count, times: Longint; rvals: Single; istats: Longint; expr: PChar): Longint; stdcall; external 'piapi32.dll';
Function piar_panvalues(pt, count, timedate: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_plotvalues(pt, intervals, count, times: Longint; rvals: Single; istats: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_putvalue(pt: Longint; rval: Single; istat, timedate, wait: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_replacevalue(pt, timedate: Longint; rval: Single; istat: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_summary(pt, time1, time2: Longint; rval, pctgood: Single; code: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_timedvalues(pt, count, times: Longint; rvals: Single; istats, prev: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_timedvaluesfil(pt, count, times: Longint; rvals: Single; istats: Longint; expr: PChar): Longint; stdcall; external 'piapi32.dll';
Function piar_timefilter(starttime, endtime: Longint; expr: PChar; tottime, passtime: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_value(pt:Longint; timedate: Pointer; mode: Longint; rval, istat: Pointer): Longint; stdcall; external 'piapi32.dll';
Function piel_addevnt(pitime, number, group, etype: Longint; msg: PChar; timeout: Longint): Longint; stdcall; external 'piapi32.dll';
Function piel_evntactn(pitime, number, group, etype, slen: Longint; msg: PChar; action, timeout: Longint): Longint; stdcall; external 'piapi32.dll';

// New : (SG) 20031015
Function pilg_checklogfile(action:Longint; LogFile: PChar):LongInt; stdcall; external 'piapi32.dll';
Function pilg_formputlog(Msg, idString:Pchar):Longint; stdcall; external 'piapi32.dll';
// ...End New

Function pilg_puthomelog(msg: PChar): Longint; stdcall; external 'piapi32.dll';
Function pilg_putlog(msg: PChar): Longint; stdcall; external 'piapi32.dll';
Function pilg_putoutput(msg: PChar; flags: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_compspecs(pt, compdev, compmin, compmax: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_compspecseng(pt: Longint; compdeveng: Single; compmin, compmax: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_dates(pt, creationdate: Longint; creator: PChar; crlen, changedate: Longint; changer: PChar; chlen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_descriptor(pt: Longint; desc: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_digcode(digcode: Longint; digPChar: PChar): Longint; stdcall; external 'piapi32.dll';
Function pipt_digcodefortag(pt, digcode: Longint; digPChar: PChar): Longint; stdcall; external 'piapi32.dll';
Function pipt_digpointers(pt, digcode, dignumb: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_digstate(digcode: Longint; digstate: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_displaydigits(pt, displaydigits: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_engunitPChar(pt: Longint; engunitPChar: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_engunPChar(engunitcode: Longint; engunitPChar: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_excspecseng(pt: Longint; excdeveng: Single; excmin, excmax: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_exdesc(pt: Longint; exdesc: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_findpoint(tagname: PChar; pt: Pointer): Longint; stdcall; external 'piapi32.dll';
Function pipt_inprocbits(pt, larchiving, lcompressing, filtercode: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_instrumenttag(pt: Longint; instrumenttag: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_location(pt, location: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_nextptwsource(source: SmallInt; pt: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_pointid(pt, ipt: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_pointsource(pt: Longint; source: PChar): Longint; stdcall; external 'piapi32.dll';
Function pipt_pointtype(pt: Longint; pttype: PChar): Longint; stdcall; external 'piapi32.dll';
Function pipt_ptexist(pt: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_recordtype(pt, steps: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_rescode(pt, rescode: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_scale(pt: Longint; zero, span: Single): Longint; stdcall; external 'piapi32.dll';
Function pipt_scan(pt, lscan: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_signupforupdates: Longint; stdcall; external 'piapi32.dll';
Function pipt_sourcept(pt, sourcept: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_squareroot(pt, squareroot: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_tag(pt: Longint; tag: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_taglong(pt: Longint; tag: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_tagpreferred(pt: Longint; tag: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
Function pipt_totalspecs(pt, totalcode: Longint; convers: Single): Longint; stdcall; external 'piapi32.dll';
Function pipt_typicalvalue(pt: Longint; typicalvalue: Single): Longint; stdcall; external 'piapi32.dll';
Function pipt_updates(pt: Longint; tagname: PChar; slen, mode: Longint): Longint; stdcall; external 'piapi32.dll';
// New  (SG) 20031015
Function pipt_userattribs(pt, userint1, userint2: Longint; userreal1, userreal2: Single): Longint; stdcall; external 'papi32.dll';
// ...End New
Function pipt_wildcardsearch(tagmask: PChar; direction, found: Longint; tagname: PChar; slen, pt, numfound: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_evmdisestablish(count, pts: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_evmestablish(count, pts: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_evmexceptions(count, pt: Longint; rval: Single; istat, timedate: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_getsnapshot(pt: Longint; rval, istat, timedate: Pointer): Longint; stdcall; external 'piapi32.dll';
Function pisn_getsnapshots(pt: Longint; rval: Single; istat, timedate, piapierror, count: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_putsnapshot(pt: Longint; rval: Single; istat, timedate: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_putsnapshots(pt: Longint; rval: Single; istat, timedate, piapierror, count: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_sendexcepstruc(pt: Longint; pttype: SmallInt; piexcept: PI_EXCEPT; count: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_sendexceptions(pt: Longint; pttype: SmallInt; oldval: Single; oldstat: SmallInt; oldtime: Longint; prevval: Single; prevstat: SmallInt; prevtime: Longint; newval: Single; newstat: SmallInt; newtime: Longint; excdeveng: Single; excmin, excmax: SmallInt; count: Longint): Longint; stdcall; external 'piapi32.dll';
// New  (SG) 20031015
Function pipt_sendexcepstrucq(pt:Longint; pttype: Smallint; piexcept: PI_EXCEPT; count: Longint; queueing: Smallint; numbpterrs: Longint; qErrs: QERROR): Longint; stdcall; external 'papi32.dll';
// ...End New

// ----- these functions have return types incompatible with Visual Basic
// Function pisn_sendexceptionq(pt: Longint; pttype; oldval: Single; oldstat: SmallInt; oldtime: Longint; prevval: Single; prevstat: SmallInt; prevtime: Longint; newval: Single; newstat: SmallInt; newtime: Longint; excdeveng: Single; excmin; excmax: SmallInt; count: Longint): QERRORS
// Function pisn_putsnapshotq(pt: Longint; rval: Single; istat: Longint; timedate: Longint): QERRORS
// Function pisn_flushputsnapq(): QERRORS
Function pitm_delay(mseconds: Longint): Longint; stdcall; external 'piapi32.dll';
Function pitm_fastservertime: Longint; stdcall; external 'piapi32.dll';
Procedure pitm_formtime(timedate: Longint; timePChar: PChar; slen: Longint); stdcall; external 'piapi32.dll';
Procedure pitm_intsec(timedate, timearray: Longint); stdcall; external 'piapi32.dll';
Function pitm_parsetime(timestr: PChar; reltime: Longint; timedate: Pointer): Longint; stdcall; external 'piapi32.dll';
Procedure pitm_secint(timedate, timearray: Longint); stdcall; external 'piapi32.dll';
Function pitm_servertime(servertime: Longint): Longint; stdcall; external 'piapi32.dll';
Function pitm_syncwithservertime: Longint; stdcall; external 'piapi32.dll';
Function pitm_systime: Longint; stdcall; external 'piapi32.dll';
Function piut_connect(procname: PChar): Longint; stdcall; external 'piapi32.dll';
Function piut_disconnect: Longint; stdcall; external 'piapi32.dll';
// New  (SG) 20031015
Function piut_disconnectnode(SrvName: PChar): Longint; stdcall; external 'piapi32.dll';
Function piut_fastserverversion(MinorVer: Longint; buildid: PChar; BuildLen: Longint): Longint; stdcall; external 'piapi32.dll';
// ...End New
Function piut_getapiversion(version: PChar; slen: Longint): Longint; stdcall; external 'piapi32.dll';
// New (SG)
Function piut_getloginuser: PChar; stdcall; external 'piapi32.dll';
// End New

// Remove by (SG) Function piut_getprofile(section, entry, pidefault, buf: PChar; retsize: Longint; pifile: PChar): Longint; stdcall; external 'piapi32.dll';
Procedure piut_getprotocolvers(vers: PChar; slen: Longint); stdcall; external 'piapi32.dll';
// New (SG)
Function piut_getserverversion(NodeID: Longint; ServerName: PChar; servernamelen: Longint; version: Smallint; versionlen: longint; buidid:Smallint; buildidlen: Longint): Longint ; stdcall; external 'piapi32.dll';
// End new.
Procedure piut_inceventcounter(counter, count: Longint); stdcall; external 'piapi32.dll';
Function piut_ishome: Longint; stdcall; external 'piapi32.dll';
Function piut_login(username, password: PChar; valid: Pointer): Longint; stdcall; external 'piapi32.dll';
Function piut_netinfo(namestr: PChar; namelen: Longint; addressstr: PChar; addresslen: Longint; typestr: PChar; typelen: Longint): Longint; stdcall; external 'piapi32.dll';
// New (SG)
Function piut_netnodeinfo(namestr: PChar; namelen: Longint; adressstr: PChar;adresslen: Longint; connected: Smallint) : Longint; stdcall; external 'piapi32.dll';
// End New
Function piut_netserverinfo(namestr: PChar; namelen: Longint; addressstr: PChar; addresslen, connected: Longint): Longint; stdcall; external 'piapi32.dll';
Function piut_setdefaultservernode(servername: PChar): Longint; stdcall; external 'piapi32.dll';
Procedure piut_setprocname(procname: PChar); stdcall; external 'piapi32.dll';
Function piut_setservernode(servername: PChar): Longint; stdcall; external 'piapi32.dll';
// Remove by (SG) Function piut_writeprofile(section, entry, buf, pifile: PChar): Longint; stdcall; external 'piapi32.dll';
Procedure piut_zeroeventcounter(counter: Longint); stdcall; external 'piapi32.dll';

Function piar_getarcvaluesx(ptnum, arcmode, count: Longint; drval: Double; ival: Longint; bval: PChar; bsize, istat: Longint; flags: SmallInt; time0, time1: PITimeStamp; funccode: Longint): Longint; stdcall; external 'piapi32.dll';
//New
Function piar_getarcvaluesfilterx(ptnum,mode,count: Longint; drval: Variant; ival:Longint; bval : Variant; bsize,istat: Longint;flags: Smallint; time0, time1: PITimeStamp; expr: PChar; funccode: Longint): Longint; stdcall; external 'piapi32.dll';
// ...
Function piar_getarcvaluex(ptnum, arcmode: Longint; drval, ival: Longint; bval: PChar; bsize, istat: Longint; flags: SmallInt; time0: PITimeStamp): Longint; stdcall; external 'piapi32.dll';
// New
Function piar_putarcvaluesx(count,mode,ptnum: Longint; drval: Variant; ival: Longint; bval: Variant; bsize,istat: Longint; flags: Smallint; time0: PITimeStamp; errors: Longint): Longint; stdcall; external 'piapi32.dll';
Function piar_putarcvaluex (ptnum,mode: Longint; drval: Variant; ival: Longint; bval: Variant; bsize,istat: Longint; flags: Smallint; time0: PITimeStamp): Longint; stdcall; external 'piapi32.dll';
// ...
Function pipt_pointtypex(ptnum, typex: Longint): Longint; stdcall; external 'piapi32.dll';
// New
Function pisn_evmexceptx(count, ptnum, typex: Longint; val: Variant; istat: Longint; flags: Smallint; timeval: PITimeStamp;funccode: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_flushputsnapqx(numbpterrs:Longint; qerrs: QERROR): Longint; stdcall; external 'piapi32.dll';
//
Function pisn_getsnapshotsx(ptnum, cntptnum: Longint; drval, ival: Longint; bval: PChar; bsize, istat: Longint; flags: SmallInt; time0: PITimeStamp; lerror, funccode: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_getsnapshotx(ptnum: Longint; drval, ival: Longint; bval: PChar; bsize, istat: Longint; flags: SmallInt; time0: PITimeStamp): Longint; stdcall; external 'piapi32.dll';
// New
Function pisn_putsnapshotqx(ptnum: Longint; drval: Variant; ival: Longint; bval: Variant; bsize: Longint; istat: Longint; flags: Smallint; TimeStamp: PITimeStamp; queueing, numbpterrs: Longint; qerrs: QERROR): Longint; stdcall; external 'piapi32.dll';
// ...
// pisn_putsnapshotsx takes a pointer to an array of PChar pointers which can't be generated in VB
Function pisn_putsnapshotsx(count, ptnum: Longint; drval, ival: Longint; bval: PChar; bsize, istat: Longint; flags: SmallInt; time0: PChar; errors: Longint): Longint; stdcall; external 'piapi32.dll';
Function pisn_putsnapshotx(ptnum: Longint; drval, ival: Longint; bval: PChar; bsize, istat: Longint; flags: SmallInt; time0: Pointer): Longint; stdcall; external 'piapi32.dll';

// New
Function pisn_sendexceptqx( pt,typex: Longint; oldval: Variant; oldistat: Longint; oldflags: Smallint; oldtime: PITimeStamp; prevval: Variant; previstat: Longint; prevflags: Smallint; prevtime: PITimeStamp; val: Variant; istat: Longint; flags: Smallint; newtime: PITimeStamp; ExcDevEng,excmin,excmax: Double; count, queueing, numbpterrs: Longint; qerrs: QERROR): Longint; stdcall; external 'piapi32.dll';
//

Function pitm_getpitime(time0: PITimeStamp; frac: Double): Longint; stdcall; external 'piapi32.dll';
// New
Function pitm_isdst(time0: PITimeStamp) : Longint; stdcall; external 'piapi32.dll';
// ...
Procedure pitm_setcurtime(time0: PITimeStamp; incl_subsec: SmallInt); stdcall; external 'piapi32.dll';
// New
Procedure pitm_setdst(time0: PITimeStamp; tm_isdst: Longint); stdcall; external 'piapi32.dll';
Function pitm_setpitime(time0: PITimeStamp; pitime: Longint; frac: Double): Longint; stdcall; external 'piapi32.dll';
Function pitm_settime(time0: PITimeStamp; xyear, xmonth, xday, xhour, xminute: Longint; xsecond: Double): Longint; stdcall; external 'piapi32.dll';

// New
Function piut_errormsg(stat: Longint; msg: PChar; msglen: Longint): Longint; stdcall; external 'piapi32.dll';
//...

Function piut_setpassword(username, oldpw, newpw: PChar): Longint; stdcall; external 'piapi32.dll';

// New
Function piut_strerror(stat: Longint; msg: PChar; msglen: Longint; srcstr: PChar): Longint; stdcall; external 'piapi32.dll';
//...

implementation

end.
