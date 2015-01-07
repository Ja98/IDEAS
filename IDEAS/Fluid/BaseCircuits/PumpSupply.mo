within IDEAS.Fluid.BaseCircuits;
model PumpSupply "Pump on supply duct"
  //Extensions
  extends Interfaces.CircuitWithPump;

  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm
    N_nominal = 1500 "Nominal rotational speed for flow characteristic"
    annotation(Dialog(group="Pump parameters"));

  //Interfaces
  Modelica.Blocks.Interfaces.RealOutput T "Supply temperature" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,100})));
  Modelica.Blocks.Interfaces.BooleanInput u "Mass flow setpoint" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,100}),  iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,100})));

  //Components
  Sensors.TemperatureTwoPort senTem(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = Medium,
    tau=120)
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Movers.FlowMachine_Nrpm pump(
    motorCooledByFluid=motorCooledByFluid,
    addPowerToMedium=addPowerToMedium,
    N_nominal=N_nominal,
    redeclare package Medium = Medium,
    motorEfficiency=motorEfficiency,
    hydraulicEfficiency=hydraulicEfficiency)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));

  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=pump.N_nominal)
                                                   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,60})));
  Modelica.Blocks.Interfaces.RealOutput P "Supply temperature" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,100})));
equation
  connect(senTem.port_b, port_b1) annotation (Line(
      points={{80,60},{100,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTem.T, T) annotation (Line(
      points={{70,71},{70,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.port_b, senTem.port_a) annotation (Line(
      points={{10,30},{50,30},{50,60},{60,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pipeSupply.port_b, pump.port_a) annotation (Line(
      points={{-60,60},{-50,60},{-50,30},{-10,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_b2, pipeReturn.port_b) annotation (Line(
      points={{-100,-60},{60,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(u, booleanToReal.u) annotation (Line(
      points={{0,100},{0,80},{2.22045e-015,80},{2.22045e-015,72}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pump.P, P) annotation (Line(
      points={{11,38},{40,38},{40,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanToReal.y, pump.Nrpm) annotation (Line(
      points={{0,49},{0,42}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(
            info="<html><p>
            This model is the base circuit implementation of a mass-flow controlled pump and makes use of <a href=\"modelica://IDEAS.Fluid.Movers.FlowMachine_m_flow\">IDEAS.Fluid.Movers.FlowMachine_m_flow</a>.
</p></html>",
            revisions="<html>
<p><ul>
<li>November 2014 by Filip Jorissen:<br> 
Initial version</li>
</ul></p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Ellipse(extent={{-20,80},{20,40}},lineColor={0,0,127},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{60,60},{100,60}},
          color={0,0,127},
          smooth=Smooth.None),
        Ellipse(
          extent={{72,62},{76,58}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{70,100},{76,80},{74,60}},
          color={255,0,0},
          smooth=Smooth.None),
        Line(
          points={{0,100},{4,86},{0,70}},
          color={0,255,128},
          smooth=Smooth.None),
        Polygon(
          points={{-12,76},{-12,44},{20,60},{-12,76}},
          lineColor={0,0,127},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{40,100},{32,80},{0,60}},
          color={255,0,0},
          smooth=Smooth.None),
        Ellipse(
          extent={{-2,62},{2,58}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)}));
end PumpSupply;
