within IDEAS.Buildings.Components;
model RectangularZone
  "Rectangular zone including walls, floor and ceiling"
  extends IDEAS.Buildings.Components.Interfaces.PartialZone(
    calculateViewFactor=true,
    final nSurf=indExtFlo+nSurfExt,
    final V=l*w*h,
    final hZone=h,
    final A=l*w);

  parameter IDEAS.Buildings.Components.Interfaces.BoundaryType bouTypA
    "Modelled boundary(ies) for face A of the zone"
    annotation(Dialog(tab="Face A"));
  parameter IDEAS.Buildings.Components.Interfaces.BoundaryType bouTypB
    "Modelled boundary(ies) for face B of the zone"
    annotation(Dialog(tab="Face B"));
  parameter IDEAS.Buildings.Components.Interfaces.BoundaryType bouTypC
    "Modelled boundary(ies) for face C of the zone"
    annotation(Dialog(tab="Face C"));
  parameter IDEAS.Buildings.Components.Interfaces.BoundaryType bouTypD
    "Modelled boundary(ies) for face D of the zone"
    annotation(Dialog(tab="Face D"));
  parameter IDEAS.Buildings.Components.Interfaces.BoundaryType bouTypFlo
    "Modelled boundary(ies) for the zone floor"
    annotation(Dialog(tab="Floor"));
  parameter IDEAS.Buildings.Components.Interfaces.BoundaryType bouTypCei
    "Modelled boundary(ies) for the zone ceiling"
    annotation(Dialog(tab="Ceiling"));
  parameter Integer nSurfExt = 0
    "Number of additional connected external surfaces";
  parameter Modelica.SIunits.Angle aziA
    "Azimuth angle of face A";
  parameter Modelica.SIunits.Length l
    "Horizontal length of faces A and C";
  parameter Modelica.SIunits.Length w
    "Horizontal length of face B and D";
  parameter Modelica.SIunits.Length h
    "Height between top of floor and bottom of ceiling";
  parameter Modelica.SIunits.Area A_winA=0
    "Surface area of window of face A"
    annotation(Dialog(tab="Face A", group="Window details",
    enable=bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Modelica.SIunits.Area A_winB=0
    "Surface area of window of face B"
    annotation(Dialog(tab="Face B", group="Window details",
    enable=bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Modelica.SIunits.Area A_winC=0
    "Surface area of window of face C"
    annotation(Dialog(tab="Face C", group="Window details",
    enable=bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Modelica.SIunits.Area A_winD=0
    "Surface area of window of face D"
    annotation(Dialog(tab="Face D", group="Window details",
    enable=bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Modelica.SIunits.Area A_winCei=0
    "Surface area of window of ceiling"
    annotation(Dialog(tab="Ceiling", group="Window details",
    enable=bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));

  parameter Real fracA=0.15
    "Area fraction of the window frame of face A"
    annotation(Dialog(tab="Face A", group="Window details",
    enable=bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Real fracB=0.15
    "Area fraction of the window frame of face B"
    annotation(Dialog(tab="Face B", group="Window details",
    enable=bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Real fracC=0.15
    "Area fraction of the window frame of face C"
    annotation(Dialog(tab="Face C", group="Window details",
    enable=bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Real fracD=0.15
    "Area fraction of the window frame of face D"
    annotation(Dialog(tab="Face D", group="Window details",
    enable=bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Real fracCei=0.15
    "Area fraction of the window frame of the ceiling"
    annotation(Dialog(tab="Ceiling", group="Window details",
    enable=bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  parameter Modelica.Fluid.Types.Dynamics energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial
    "Static (steady state) or transient (dynamic) thermal conduction model for all surfaces"
    annotation(Dialog(tab="Initialization"));
  parameter Boolean linIntCon=sim.linIntCon
    "= true, if convective heat transfer should be linearised"
    annotation(Dialog(tab="Advanced", group="Convective heat exchange"));
  parameter Interfaces.WindowDynamicsType windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two
    "Type of dynamics for glazings and frames: using zero, one combined or two states"
    annotation(Dialog(group="Windows", tab="Advanced"));
  parameter Real fraC=if winCei.windowDynamicsType == IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two
       and winCei.fraType.present then winCei.frac else 0
    "Fraction of thermal mass C that is attributed to frame"
    annotation(Dialog(group="Windows", tab="Advanced"));
  parameter SI.TemperatureDifference dT_nominal_win=-3
    "Nominal temperature difference used for linearisation, negative temperatures indicate the solid is colder"
    annotation(Dialog(group="Convective heat transfer", tab="Advanced"));
  parameter Boolean linExtCon=sim.linExtCon
    "= true, if exterior convective heat transfer should be linearised (uses average wind speed)"
    annotation(Dialog(tab="Advanced", group="Convective heat exchange"));
  parameter Boolean linExtRad=sim.linExtRad
    "= true, if exterior radiative heat transfer should be linearised"
    annotation(Dialog(tab="Advanced", group="Radiative heat exchange"));
  parameter SI.TemperatureDifference dT_nominal_bou=-1
    "Nominal temperature difference for boundary walls, used for linearisation, negative temperatures indicate the solid is colder"
    annotation(Dialog(tab="Advanced", group="Convective heat transfer"));
  parameter SI.TemperatureDifference dT_nominal_out=-3
    "Nominal temperature difference for outer walls, used for linearisation, negative temperatures indicate the solid is colder"
    annotation(Dialog(tab="Advanced", group="Convective heat transfer"));
  parameter SI.Temperature TeAvg=273.15 + 10.8
    "Annual average outdoor temperature"
    annotation(Dialog(tab="Floor", group="Slab on ground", enable=bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround));
  parameter SI.Temperature TiAvg=273.15 + 22
    "Annual average indoor temperature"
    annotation(Dialog(tab="Floor", group="Slab on ground", enable=bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround));
  parameter SI.TemperatureDifference dTeAvg=4
    "Amplitude of variation of monthly average outdoor temperature"
    annotation(Dialog(tab="Floor", group="Slab on ground", enable=bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround));
  parameter SI.TemperatureDifference dTiAvg=2
    "Amplitude of variation of monthly average indoor temperature"
    annotation(Dialog(tab="Floor", group="Slab on ground", enable=bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround));
  parameter SI.TemperatureDifference dT_nominal_intA=1
    "Nominal temperature difference between zone air and interior walls, used for linearisation"
    annotation(Dialog(tab="Advanced", group="Convective heat transfer"));
  parameter SI.TemperatureDifference dT_nominal_intB=1
    "Nominal temperature difference between interior walls exterior connection, used for linearisation"
    annotation(Dialog(tab="Advanced", group="Convective heat transfer"));
  replaceable parameter IDEAS.Buildings.Data.Interfaces.Construction constructionTypeA
    constrainedby IDEAS.Buildings.Data.Interfaces.Construction
    "Material structure of face A" annotation (
    choicesAllMatching=true,
    Placement(transformation(extent={{-34,78},{-30,82}})),
    Dialog(tab="Face A",group="Construction details"));
  replaceable parameter IDEAS.Buildings.Data.Interfaces.Construction constructionTypeB
    constrainedby IDEAS.Buildings.Data.Interfaces.Construction
    "Material structure of face B" annotation (
    choicesAllMatching=true,
    Placement(transformation(extent={{-34,78},{-30,82}})),
    Dialog(tab="Face B",group="Construction details"));
  replaceable parameter IDEAS.Buildings.Data.Interfaces.Construction constructionTypeC
    constrainedby IDEAS.Buildings.Data.Interfaces.Construction
    "Material structure of face C" annotation (
    choicesAllMatching=true,
    Placement(transformation(extent={{-34,78},{-30,82}})),
    Dialog(tab="Face C",group="Construction details"));
  replaceable parameter IDEAS.Buildings.Data.Interfaces.Construction constructionTypeD
    constrainedby IDEAS.Buildings.Data.Interfaces.Construction
    "Material structure of face D" annotation (
    choicesAllMatching=true,
    Placement(transformation(extent={{-34,78},{-30,82}})),
    Dialog(tab="Face D",group="Construction details"));
  replaceable parameter IDEAS.Buildings.Data.Interfaces.Construction constructionTypeCei
    constrainedby IDEAS.Buildings.Data.Interfaces.Construction
    "Material structure of ceiling" annotation (
    choicesAllMatching=true,
    Placement(transformation(extent={{-34,78},{-30,82}})),
    Dialog(tab="Ceiling",group="Construction details"));
  replaceable parameter IDEAS.Buildings.Data.Interfaces.Construction constructionTypeFlo
    constrainedby IDEAS.Buildings.Data.Interfaces.Construction
    "Material structure of floor" annotation (
    choicesAllMatching=true,
    Placement(transformation(extent={{-34,78},{-30,82}})),
    Dialog(tab="Floor",group="Construction details"));
  replaceable IDEAS.Buildings.Data.Glazing.Ins2 glazingA
    constrainedby IDEAS.Buildings.Data.Interfaces.Glazing "Glazing type of window of face A"
    annotation (choicesAllMatching=true,
    Dialog(tab="Face A", group="Window details",
           enable = bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable IDEAS.Buildings.Data.Glazing.Ins2 glazingB
    constrainedby IDEAS.Buildings.Data.Interfaces.Glazing "Glazing type of window of face B"
    annotation (choicesAllMatching=true,
    Dialog(tab="Face B", group="Window details",
           enable = bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable IDEAS.Buildings.Data.Glazing.Ins2 glazingC
    constrainedby IDEAS.Buildings.Data.Interfaces.Glazing "Glazing type of window of face C"
    annotation (choicesAllMatching=true,
    Dialog(tab="Face C", group="Window details",
           enable = bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable IDEAS.Buildings.Data.Glazing.Ins2 glazingD
    constrainedby IDEAS.Buildings.Data.Interfaces.Glazing "Glazing type of window of face D"
    annotation (choicesAllMatching=true,
    Dialog(tab="Face D", group="Window details",
           enable = bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable IDEAS.Buildings.Data.Glazing.Ins2 glazingCei
    constrainedby IDEAS.Buildings.Data.Interfaces.Glazing "Glazing type of window of ceiling"
    annotation (
           choicesAllMatching=true,
           Dialog(tab="Ceiling", group="Window details",
           enable = bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));

  replaceable parameter IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties shaTypA
    constrainedby
    IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
    "Shading type and properties of window of face A"
    annotation (
           choicesAllMatching=true,
           Dialog(tab="Face A", group="Window details",
           enable = bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable parameter IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties shaTypB
    constrainedby
    IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
    "Shading type and properties of window of face B"
    annotation (
           choicesAllMatching=true,
           Dialog(tab="Face B", group="Window details",
           enable = bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable parameter IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties shaTypC
    constrainedby
    IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
    "Shading type and properties of window of face C"
    annotation (
           choicesAllMatching=true,
           Dialog(tab="Face C", group="Window details",
           enable = bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable parameter IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties shaTypD
    constrainedby
    IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
    "Shading type and properties of window of face D"
    annotation (
           choicesAllMatching=true,
           Dialog(tab="Face D", group="Window details",
           enable = bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));
  replaceable parameter IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties shaTypCei
    constrainedby
    IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
    "Shading type and properties of window of ceiling"
    annotation (
           choicesAllMatching=true,
           Dialog(tab="Ceiling", group="Window details",
           enable = bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
                    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
                    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
                    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow));

protected
  IDEAS.Buildings.Components.Window winA(azi=aziA, inc=IDEAS.Types.Tilt.Wall,
    glazing(
      nLay=glazingA.nLay,
      mats=glazingA.mats,
      SwAbs=glazingA.SwAbs,
      SwTrans=glazingA.SwTrans,
      SwAbsDif=glazingA.SwAbsDif,
      SwTransDif=glazingA.SwTransDif,
      U_value=glazingA.U_value,
      g_value=glazingA.g_value),
    A=A_winA,
    frac=fracA,
    redeclare ThermalBridges.None briType,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_win,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    windowDynamicsType=windowDynamicsType,
    fraC=fraC,
    redeclare IDEAS.Buildings.Components.Shading.Shading shaType(shaPro(
  controlled=shaTypA.controlled,
  shaType=shaTypA.shaType,
  hWin=shaTypA.hWin,
  wWin=shaTypA.wWin,
  wLeft=shaTypA.wLeft,
  wRight=shaTypA.wRight,
  ovDep=shaTypA.ovDep,
  ovGap=shaTypA.ovGap,
  hFin=shaTypA.hFin,
  finDep=shaTypA.finDep,
  finGap=shaTypA.finGap,
  L=shaTypA.L,
  dh=shaTypA.dh,
  shaCorr=shaTypA.shaCorr))) if
       hasWinA
    "Window for face A of this zone" annotation (Placement(transformation(extent={{-100,0},{-90,20}})));
  IDEAS.Buildings.Components.Window winB(
      inc=IDEAS.Types.Tilt.Wall,
    glazing(
      nLay=glazingB.nLay,
      mats=glazingB.mats,
      SwAbs=glazingB.SwAbs,
      SwTrans=glazingB.SwTrans,
      SwAbsDif=glazingB.SwAbsDif,
      SwTransDif=glazingB.SwTransDif,
      U_value=glazingB.U_value,
      g_value=glazingB.g_value),
    A=A_winB,
    frac=fraB,
    redeclare ThermalBridges.None briType,
    azi=aziA + Modelica.Constants.pi/2,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_win,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    windowDynamicsType=windowDynamicsType,
    fraC=fraC,
    redeclare IDEAS.Buildings.Components.Shading.Shading shaType(shaPro(
  controlled=shaTypB.controlled,
  shaType=shaTypB.shaType,
  hWin=shaTypB.hWin,
  wWin=shaTypB.wWin,
  wLeft=shaTypB.wLeft,
  wRight=shaTypB.wRight,
  ovDep=shaTypB.ovDep,
  ovGap=shaTypB.ovGap,
  hFin=shaTypB.hFin,
  finDep=shaTypB.finDep,
  finGap=shaTypB.finGap,
  L=shaTypB.L,
  dh=shaTypB.dh,
  shaCorr=shaTypB.shaCorr))) if
       hasWinB
    "Window for face B of this zone" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=0,
        origin={-95,-10})));
  IDEAS.Buildings.Components.Window winC(inc=IDEAS.Types.Tilt.Wall,
    glazing(
      nLay=glazingC.nLay,
      mats=glazingC.mats,
      SwAbs=glazingC.SwAbs,
      SwTrans=glazingC.SwTrans,
      SwAbsDif=glazingC.SwAbsDif,
      SwTransDif=glazingC.SwTransDif,
      U_value=glazingC.U_value,
      g_value=glazingC.g_value),
    A=A_winC,
    frac=fracC,
    redeclare ThermalBridges.None briType,
    azi=aziA + Modelica.Constants.pi,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_win,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    windowDynamicsType=windowDynamicsType,
    fraC=fraC,
    redeclare IDEAS.Buildings.Components.Shading.Shading shaType(shaPro(
  controlled=shaTypC.controlled,
  shaType=shaTypC.shaType,
  hWin=shaTypC.hWin,
  wWin=shaTypC.wWin,
  wLeft=shaTypC.wLeft,
  wRight=shaTypC.wRight,
  ovDep=shaTypC.ovDep,
  ovGap=shaTypC.ovGap,
  hFin=shaTypC.hFin,
  finDep=shaTypC.finDep,
  finGap=shaTypC.finGap,
  L=shaTypC.L,
  dh=shaTypC.dh,
  shaCorr=shaTypC.shaCorr))) if
       hasWinC
    "Window for face C of this zone" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=0,
        origin={-95,-30})));
  IDEAS.Buildings.Components.Window winD(inc=IDEAS.Types.Tilt.Wall, azi=aziA +
        Modelica.Constants.pi/2*3,
    glazing(
      nLay=glazingD.nLay,
      mats=glazingD.mats,
      SwAbs=glazingD.SwAbs,
      SwTrans=glazingD.SwTrans,
      SwAbsDif=glazingD.SwAbsDif,
      SwTransDif=glazingD.SwTransDif,
      U_value=glazingD.U_value,
      g_value=glazingD.g_value),
    A=A_winD,
    frac=fracD,
    redeclare ThermalBridges.None briType,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_win,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    windowDynamicsType=windowDynamicsType,
    fraC=fraC,
    redeclare IDEAS.Buildings.Components.Shading.Shading shaType(shaPro(
      controlled=shaTypD.controlled,
  shaType=shaTypD.shaType,
  hWin=shaTypD.hWin,
  wWin=shaTypD.wWin,
  wLeft=shaTypD.wLeft,
  wRight=shaTypD.wRight,
  ovDep=shaTypD.ovDep,
  ovGap=shaTypD.ovGap,
  hFin=shaTypD.hFin,
  finDep=shaTypD.finDep,
  finGap=shaTypD.finGap,
  L=shaTypD.L,
  dh=shaTypD.dh,
  shaCorr=shaTypD.shaCorr))) if
       hasWinD
    "Window for face D of this zone" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=0,
        origin={-95,-50})));
  IDEAS.Buildings.Components.Window winCei(inc=IDEAS.Types.Tilt.Ceiling, azi=aziA,
    glazing(
      nLay=glazingCei.nLay,
      mats=glazingCei.mats,
      SwAbs=glazingCei.SwAbs,
      SwTrans=glazingCei.SwTrans,
      SwAbsDif=glazingCei.SwAbsDif,
      SwTransDif=glazingCei.SwTransDif,
      U_value=glazingCei.U_value,
      g_value=glazingCei.g_value),
    A=A_winCei,
    frac=fracCei,
    redeclare ThermalBridges.None briType,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_win,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    windowDynamicsType=windowDynamicsType,
    fraC=fraC,
    redeclare IDEAS.Buildings.Components.Shading.Shading shaType(shaPro(
      controlled=shaTypCei.controlled,
  shaType=shaTypCei.shaType,
  hWin=shaTypCei.hWin,
  wWin=shaTypCei.wWin,
  wLeft=shaTypCei.wLeft,
  wRight=shaTypCei.wRight,
  ovDep=shaTypCei.ovDep,
  ovGap=shaTypCei.ovGap,
  hFin=shaTypCei.hFin,
  finDep=shaTypCei.finDep,
  finGap=shaTypCei.finGap,
  L=shaTypCei.L,
  dh=shaTypCei.dh,
  shaCorr=shaTypCei.shaCorr))) if
       hasWinCei
    "Window for ceiling of this zone" annotation (Placement(
        transformation(
        extent={{-5,-10},{5,10}},
        rotation=0,
        origin={-95,-90})));

  IDEAS.Buildings.Components.BoundaryWall bouA(azi=aziA, inc=IDEAS.Types.Tilt.Wall,
    constructionType(
      nLay=constructionTypeA.nLay,
      nGain=constructionTypeA.nGain,
      locGain=constructionTypeA.locGain,
      incLastLay=constructionTypeA.incLastLay,
      mats=constructionTypeA.mats),
    insulationThickness=0,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_bou,
    AWall=l*h - (if hasWinA then A_winA else 0)) if
       hasBouA
    "Boundary wall for face A of this zone"
    annotation (Placement(transformation(extent={{-120,0},{-110,20}})));
  IDEAS.Buildings.Components.BoundaryWall bouB(
           inc=IDEAS.Types.Tilt.Wall,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeB.nLay,
      nGain=constructionTypeB.nGain,
      locGain=constructionTypeB.locGain,
      incLastLay=constructionTypeB.incLastLay,
      mats=constructionTypeB.mats),
    azi=aziA + Modelica.Constants.pi/2,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_bou,
    AWall=l*h - (if hasWinB then A_winB else 0)) if
       hasBouB
    "Boundary wall for face A of this zone"
    annotation (Placement(transformation(extent={{-120,-20},{-110,0}})));
  IDEAS.Buildings.Components.BoundaryWall bouC(inc=IDEAS.Types.Tilt.Wall,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeC.nLay,
      nGain=constructionTypeC.nGain,
      locGain=constructionTypeC.locGain,
      incLastLay=constructionTypeC.incLastLay),
    azi=aziA + Modelica.Constants.pi,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_bou,
    AWall=l*h - (if hasWinC then A_winC else 0)) if
       hasBouC
    "Boundary wall for face C of this zone"
    annotation (Placement(transformation(extent={{-120,-40},{-110,-20}})));
  IDEAS.Buildings.Components.BoundaryWall bouD(inc=IDEAS.Types.Tilt.Wall, azi=aziA
         + Modelica.Constants.pi/2*3,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeD.nLay,
      nGain=constructionTypeD.nGain,
      locGain=constructionTypeC.locGain,
      incLastLay=constructionTypeC.incLastLay,
      mats=constructionTypeC.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_bou,
    AWall=l*h - (if hasWinD then A_winD else 0)) if
       hasBouD
    "Boundary wall for face D of this zone"
    annotation (Placement(transformation(extent={{-120,-60},{-110,-40}})));
  IDEAS.Buildings.Components.BoundaryWall bouFlo(inc=IDEAS.Types.Tilt.Floor, azi=aziA,
    AWall=A,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeFlo.nLay,
      nGain=constructionTypeFlo.nGain,
      locGain=constructionTypeFlo.locGain,
      incLastLay=constructionTypeFlo.incLastLay,
      mats=constructionTypeFlo.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_bou) if
       hasBouFlo
    "Boundary wall for zone floor"
    annotation (Placement(transformation(extent={{-120,-80},{-110,-60}})));
  IDEAS.Buildings.Components.BoundaryWall bouCei(inc=IDEAS.Types.Tilt.Ceiling, azi=aziA,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeCei.nLay,
      nGain=constructionTypeCei.nGain,
      locGain=constructionTypeCei.locGain,
      incLastLay=constructionTypeCei.incLastLay,
      mats=constructionTypeCei.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_bou,
    AWall=l*h - (if hasWinCei then A_winCei else 0)) if
       hasBouCei
    "Boundary wall for zone ceiling"
    annotation (Placement(transformation(extent={{-120,-100},{-110,-80}})));
  IDEAS.Buildings.Components.OuterWall outA(azi=aziA, inc=IDEAS.Types.Tilt.Wall,
    constructionType(
      nLay=constructionTypeA.nLay,
      nGain=constructionTypeA.nGain,
      locGain=constructionTypeA.locGain,
      incLastLay=constructionTypeA.incLastLay,
      mats=constructionTypeA.mats),
    insulationThickness=0,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_out,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    AWall=l*h - (if hasWinA then A_winA else 0)) if
       hasOutA
    "Outer wall for face A of this zone"
    annotation (Placement(transformation(extent={{-140,0},{-130,20}})));
  IDEAS.Buildings.Components.OuterWall outB(
      inc=IDEAS.Types.Tilt.Wall,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeB.nLay,
      nGain=constructionTypeB.nGain,
      locGain=constructionTypeB.locGain,
      incLastLay=constructionTypeB.incLastLay,
      mats=constructionTypeB.mats),
    azi=aziA + Modelica.Constants.pi/2,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_out,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    AWall=l*h - (if hasWinB then A_winB else 0)) if
       hasOutB
    "Outer wall for face B of this zone"
    annotation (Placement(transformation(extent={{-140,-20},{-130,0}})));
  IDEAS.Buildings.Components.OuterWall outC(inc=IDEAS.Types.Tilt.Wall,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeC.nLay,
      nGain=constructionTypeC.nGain,
      locGain=constructionTypeC.locGain,
      incLastLay=constructionTypeC.incLastLay),
    azi=aziA + Modelica.Constants.pi,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_out,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    AWall=l*h - (if hasWinC then A_winC else 0)) if
       hasOutC
    "Outer wall for face C of this zone"
    annotation (Placement(transformation(extent={{-140,-40},{-130,-20}})));
  IDEAS.Buildings.Components.OuterWall outD(inc=IDEAS.Types.Tilt.Wall, azi=aziA +
        Modelica.Constants.pi/2*3,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeD.nLay,
      nGain=constructionTypeD.nGain,
      locGain=constructionTypeC.locGain,
      incLastLay=constructionTypeC.incLastLay,
      mats=constructionTypeC.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_out,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    AWall=l*h - (if hasWinD then A_winD else 0)) if
       hasOutD
    "Outer wall for face D of this zone"
    annotation (Placement(transformation(extent={{-140,-60},{-130,-40}})));
  IDEAS.Buildings.Components.OuterWall outCei(inc=IDEAS.Types.Tilt.Ceiling, azi=aziA,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeCei.nLay,
      nGain=constructionTypeCei.nGain,
      locGain=constructionTypeCei.locGain,
      incLastLay=constructionTypeCei.incLastLay,
      mats=constructionTypeCei.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_out,
    linExtCon=linExtCon,
    linExtRad=linExtRad,
    AWall=l*h - (if hasWinCei then A_winCei else 0)) if
       hasOutCei
    "Outer wall for zone ceiling"
    annotation (Placement(transformation(extent={{-140,-100},{-130,-80}})));
  IDEAS.Buildings.Components.SlabOnGround slaOnGro(inc=IDEAS.Types.Tilt.Floor, azi=aziA,
    AWall=A,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeFlo.nLay,
      nGain=constructionTypeFlo.nGain,
      locGain=constructionTypeFlo.locGain,
      incLastLay=constructionTypeFlo.incLastLay,
      mats=constructionTypeFlo.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    PWall=2*(l + w),
    TeAvg=TeAvg,
    TiAvg=TiAvg,
    dTeAvg=dTeAvg,
    dTiAvg=dTiAvg) if
     bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround
    "Slab on ground model for zone floor"
    annotation (Placement(transformation(extent={{-160,-80},{-150,-60}})));
  IDEAS.Buildings.Components.InternalWall intA(azi=aziA, inc=IDEAS.Types.Tilt.Wall,
    constructionType(
      nLay=constructionTypeA.nLay,
      nGain=constructionTypeA.nGain,
      locGain=constructionTypeA.locGain,
      mats=constructionTypeA.mats,
      incLastLay=constructionTypeA.incLastLay),
    insulationThickness=0,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_intA,
    linIntCon_b=linIntCon,
    dT_nominal_b=dT_nominal_intB,
    AWall=l*h - (if hasWinA then A_winA else 0)) if
    hasIntA
    "Internal wall for face A of this zone"
    annotation (Placement(transformation(extent={{-176,0},{-164,20}})));
  IDEAS.Buildings.Components.InternalWall intB(
           inc=IDEAS.Types.Tilt.Wall,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeB.nLay,
      nGain=constructionTypeB.nGain,
      locGain=constructionTypeB.locGain,
      incLastLay=constructionTypeB.incLastLay,
      mats=constructionTypeB.mats),
    azi=aziA + Modelica.Constants.pi/2,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_intA,
    linIntCon_b=linIntCon,
    dT_nominal_b=dT_nominal_intB,
    AWall=l*h - (if hasWinB then A_winB else 0)) if
    hasIntB
    "Internal wall for face B of this zone"
    annotation (Placement(transformation(extent={{-176,-20},{-164,0}})));
  IDEAS.Buildings.Components.InternalWall intC(inc=IDEAS.Types.Tilt.Wall,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeC.nLay,
      nGain=constructionTypeC.nGain,
      locGain=constructionTypeC.locGain,
      incLastLay=constructionTypeC.incLastLay),
    azi=aziA + Modelica.Constants.pi,
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_intA,
    linIntCon_b=linIntCon,
    dT_nominal_b=dT_nominal_intB,
    AWall=l*h - (if hasWinC then A_winC else 0)) if
    hasIntC
    "Internal wall for face C of this zone"
    annotation (Placement(transformation(extent={{-176,-40},{-164,-20}})));
  IDEAS.Buildings.Components.InternalWall intD(inc=IDEAS.Types.Tilt.Wall, azi=aziA
         + Modelica.Constants.pi/2*3,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeD.nLay,
      nGain=constructionTypeD.nGain,
      locGain=constructionTypeC.locGain,
      incLastLay=constructionTypeC.incLastLay,
      mats=constructionTypeC.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_intA,
    linIntCon_b=linIntCon,
    dT_nominal_b=dT_nominal_intB,
    AWall=l*h - (if hasWinD then A_winD else 0)) if
    hasIntD
    "Internal wall for face D of this zone"
    annotation (Placement(transformation(extent={{-176,-60},{-164,-40}})));
  IDEAS.Buildings.Components.InternalWall intFlo(inc=IDEAS.Types.Tilt.Floor, azi=aziA,
    AWall=A,
    insulationThickness=0,
    constructionType(
      nLay=constructionTypeFlo.nLay,
      nGain=constructionTypeFlo.nGain,
      locGain=constructionTypeFlo.locGain,
      incLastLay=constructionTypeFlo.incLastLay,
      mats=constructionTypeFlo.mats),
    T_start=T_start,
    linIntCon_a=linIntCon,
    energyDynamics=energyDynamics,
    dT_nominal_a=dT_nominal_intA,
    linIntCon_b=linIntCon,
    dT_nominal_b=dT_nominal_intB) if
    hasIntFlo
    "Internal wall for zone floor"
    annotation (Placement(transformation(extent={{-176,-80},{-164,-60}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus proBusA(
    each final numIncAndAziInBus=sim.numIncAndAziInBus,
    each final computeConservationOfEnergy=sim.computeConservationOfEnergy,
    each weaBus(final outputAngles=sim.outputAngles)) if
       hasExtBusA
    "Propsbus connector for connecting to external surface or internalWall of face A"
    annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-188,10}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-80,40})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus proBusB(
    each final numIncAndAziInBus=sim.numIncAndAziInBus,
    each final computeConservationOfEnergy=sim.computeConservationOfEnergy,
    each weaBus(final outputAngles=sim.outputAngles)) if
       hasExtBusB
    "Propsbus connector for connecting to external surface or internalWall of face B"
    annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-188,-10}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-80,40})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus proBusC(
    each final numIncAndAziInBus=sim.numIncAndAziInBus,
    each final computeConservationOfEnergy=sim.computeConservationOfEnergy,
    each weaBus(final outputAngles=sim.outputAngles)) if
       hasExtBusC
    "Propsbus connector for connecting to external surface or internalWall of face C"
    annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-188,-30}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-80,40})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus proBusD(
    each final numIncAndAziInBus=sim.numIncAndAziInBus,
    each final computeConservationOfEnergy=sim.computeConservationOfEnergy,
    each weaBus(final outputAngles=sim.outputAngles)) if
       hasExtBusD
    "Propsbus connector for connecting to external surface or internalWall of face D"
    annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-188,-50}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-80,40})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus proBusFlo(
    each final numIncAndAziInBus=sim.numIncAndAziInBus,
    each final computeConservationOfEnergy=sim.computeConservationOfEnergy,
    each weaBus(final outputAngles=sim.outputAngles)) if
       hasExtBusFlo
    "Propsbus connector for connecting to external surface or internalWall of floor"
    annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-188,-70}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-80,40})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus proBusCei(
    each final numIncAndAziInBus=sim.numIncAndAziInBus,
    each final computeConservationOfEnergy=sim.computeConservationOfEnergy,
    each weaBus(final outputAngles=sim.outputAngles)) if
       hasExtBusCei
    "Propsbus connector for connecting to external surface of ceiling: internal walls should be modelled as the floor of the zone above"
    annotation (Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-188,-90}), iconTransformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={-80,40})));
protected
  final parameter Boolean hasWinA=
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow;
  final parameter Boolean hasWinB=
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow;
  final parameter Boolean hasWinC=
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow;
  final parameter Boolean hasWinD=
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow;
  final parameter Boolean hasWinCei=
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow;
  final parameter Boolean hasBouA=
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWall;
  final parameter Boolean hasBouB=
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWall;
  final parameter Boolean hasBouC=
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWall;
  final parameter Boolean hasBouD=
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWall;
  final parameter Boolean hasBouFlo=
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWall;
  final parameter Boolean hasBouCei=
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWall;
  final parameter Boolean hasOutA=
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall;
  final parameter Boolean hasOutB=
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall;
  final parameter Boolean hasOutC=
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall;
  final parameter Boolean hasOutD=
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall;
  final parameter Boolean hasOutCei=
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall;
  final parameter Boolean hasIntA=
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall;
  final parameter Boolean hasIntB=
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall;
  final parameter Boolean hasIntC=
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall;
  final parameter Boolean hasIntD=
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall;
  final parameter Boolean hasIntFlo=
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall;
  final parameter Boolean hasExtBusA=
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtBusB=
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtBusC=
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtBusD=
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtBusFlo=
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall or
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtBusCei=
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtA=
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypA == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtB=
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypB == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtC=
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypC == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtD=
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypD == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtFlo=
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypFlo == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;
  final parameter Boolean hasExtCei=
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow or
    bouTypCei == IDEAS.Buildings.Components.Interfaces.BoundaryType.External;

  final parameter Integer indWinA = 6 + (if hasWinA then 1 else 0);
  final parameter Integer indWinB = indWinA + (if hasWinB then 1 else 0);
  final parameter Integer indWinC = indWinB + (if hasWinC then 1 else 0);
  final parameter Integer indWinD = indWinC + (if hasWinD then 1 else 0);
  final parameter Integer indWinCei = indWinD + (if hasWinCei then 1 else 0);
  final parameter Integer indExtA = indWinCei +  (if hasExtA then 1 else 0);
  final parameter Integer indExtB = indExtA + (if hasExtB then 1 else 0);
  final parameter Integer indExtC = indExtB + (if hasExtC then 1 else 0);
  final parameter Integer indExtD = indExtC + (if hasExtD then 1 else 0);
  final parameter Integer indExtFlo = indExtD + (if hasExtFlo then 1 else 0);
  final parameter Integer indExtCei = indExtFlo + (if hasExtCei then 1 else 0);
initial equation
  assert(not bouTypA==IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround, "The value for bouTypA is not supported");
  assert(not bouTypB==IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround, "The value for bouTypB is not supported");
  assert(not bouTypC==IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround, "The value for bouTypC is not supported");
  assert(not bouTypD==IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround, "The value for bouTypD is not supported");
  assert(not bouTypCei==IDEAS.Buildings.Components.Interfaces.BoundaryType.SlabOnGround, "The value for bouTypCei is not supported");
  assert(not (bouTypFlo==IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall or
              bouTypFlo==IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWallAndWindow or
              bouTypFlo==IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow or
              bouTypFlo==IDEAS.Buildings.Components.Interfaces.BoundaryType.BoundaryWallAndWindow or
              bouTypFlo==IDEAS.Buildings.Components.Interfaces.BoundaryType.ExternalAndWindow), "The value for bouTypFlo is not supported");
  assert(not (bouTypCei==IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall or
              bouTypCei==IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWallAndWindow),
              "Using internal walls for the ceiling is not allowed because it is considered bad practice. 
              Use instead the 'External'  connection to connect the the floor of the surface above, 
              or use this option to connect and internal wall externally.");



equation
  connect(intA.propsBus_a, propsBusInt[1]) annotation (Line(
      points={{-165,12},{-152,12},{-152,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(intB.propsBus_a, propsBusInt[2]) annotation (Line(
      points={{-165,-8},{-152,-8},{-152,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(intC.propsBus_a, propsBusInt[3]) annotation (Line(
      points={{-165,-28},{-152,-28},{-152,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(intD.propsBus_a, propsBusInt[4]) annotation (Line(
      points={{-165,-48},{-152,-48},{-152,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(intFlo.propsBus_a, propsBusInt[5]) annotation (Line(
      points={{-165,-68},{-152,-68},{-152,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(slaOnGro.propsBus_a, propsBusInt[5]) annotation (Line(
      points={{-150,-68},{-150,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(outA.propsBus_a, propsBusInt[1]) annotation (Line(
      points={{-130,12},{-130,12},{-124,12},{-124,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(outB.propsBus_a, propsBusInt[2]) annotation (Line(
      points={{-130,-8},{-124,-8},{-124,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(outC.propsBus_a, propsBusInt[3]) annotation (Line(
      points={{-130,-28},{-124,-28},{-124,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(outD.propsBus_a, propsBusInt[4]) annotation (Line(
      points={{-130,-48},{-124,-48},{-124,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(outCei.propsBus_a, propsBusInt[6]) annotation (Line(
      points={{-130,-88},{-124,-88},{-124,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(bouA.propsBus_a, propsBusInt[1]) annotation (Line(
      points={{-110,12},{-108,12},{-106,12},{-106,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(bouB.propsBus_a, propsBusInt[2]) annotation (Line(
      points={{-110,-8},{-106,-8},{-106,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(bouC.propsBus_a, propsBusInt[3]) annotation (Line(
      points={{-110,-28},{-106,-28},{-106,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(bouD.propsBus_a, propsBusInt[4]) annotation (Line(
      points={{-110,-48},{-106,-48},{-106,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(bouFlo.propsBus_a, propsBusInt[5]) annotation (Line(
      points={{-110,-68},{-106,-68},{-106,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(bouCei.propsBus_a, propsBusInt[6]) annotation (Line(
      points={{-110,-88},{-106,-88},{-106,-76},{-106,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(winA.propsBus_a, propsBusInt[indWinA]) annotation (Line(
      points={{-90,12},{-88,12},{-88,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(winB.propsBus_a, propsBusInt[indWinB]) annotation (Line(
      points={{-90,-8},{-88,-8},{-88,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(winC.propsBus_a, propsBusInt[indWinC]) annotation (Line(
      points={{-90,-28},{-88,-28},{-88,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(winD.propsBus_a, propsBusInt[indWinD]) annotation (Line(
      points={{-90,-48},{-88,-48},{-88,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(winCei.propsBus_a, propsBusInt[indWinCei]) annotation (Line(
      points={{-90,-88},{-88,-88},{-88,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  connect(intA.propsBus_b, proBusA) annotation (Line(
      points={{-175,12},{-188,12},{-188,10}},
      color={255,204,51},
      thickness=0.5));
  connect(intB.propsBus_b, proBusB) annotation (Line(
      points={{-175,-8},{-188,-8},{-188,-10}},
      color={255,204,51},
      thickness=0.5));
  connect(intC.propsBus_b, proBusC) annotation (Line(
      points={{-175,-28},{-188,-28},{-188,-30}},
      color={255,204,51},
      thickness=0.5));
  connect(intD.propsBus_b, proBusD) annotation (Line(
      points={{-175,-48},{-188,-48},{-188,-50}},
      color={255,204,51},
      thickness=0.5));
  connect(intFlo.propsBus_b, proBusFlo) annotation (Line(
      points={{-175,-68},{-188,-68},{-188,-70}},
      color={255,204,51},
      thickness=0.5));
  if hasExtA then
    connect(proBusA, propsBusInt[indExtA]) annotation (Line(
      points={{-188,10},{-188,10},{-188,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  end if;
  if hasExtB then
    connect(proBusB, propsBusInt[indExtB]) annotation (Line(
      points={{-188,-10},{-188,-10},{-188,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  end if;
  if hasExtC then
    connect(proBusC, propsBusInt[indExtC]) annotation (Line(
      points={{-188,-30},{-188,-30},{-188,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  end if;
  if hasExtD then
    connect(proBusD, propsBusInt[indExtD]) annotation (Line(
      points={{-188,-50},{-188,-50},{-188,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  end if;
  if hasExtFlo then
    connect(proBusFlo, propsBusInt[indExtFlo]) annotation (Line(
      points={{-188,-70},{-188,-70},{-188,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  end if;
  if hasExtCei then
    connect(proBusCei, propsBusInt[indExtCei]) annotation (Line(
      points={{-188,-90},{-188,-90},{-188,40},{-80,40}},
      color={255,204,51},
      thickness=0.5));
  end if;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-220,-100},
            {100,100}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-100},{100,100}}),
                    graphics={
        Text(
          extent={{-220,-60},{-200,-80}},
          lineColor={28,108,200},
          textString="Floor"),
        Text(
          extent={{-220,-80},{-200,-100}},
          lineColor={28,108,200},
          textString="Ceiling"),
        Text(
          extent={{-220,-40},{-200,-60}},
          lineColor={28,108,200},
          textString="D"),
        Text(
          extent={{-220,-20},{-200,-40}},
          lineColor={28,108,200},
          textString="C"),
        Text(
          extent={{-220,0},{-200,-20}},
          lineColor={28,108,200},
          textString="B"),
        Text(
          extent={{-220,20},{-200,0}},
          lineColor={28,108,200},
          textString="A")}));
end RectangularZone;
