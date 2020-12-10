package Analizo::ModuleMetric;

sub new {
  return bless { cache => {} }, __PACKAGE__;
}

sub value {
  my ($self, $module) = @_;

  my $start_time = Time::HiRes::gettimeofday();
  $self->{cache}->{$module} = $self->calculate($module);
  my $stop_time = Time::HiRes::gettimeofday();
  my $diff = ($stop_time - $start_time)*1000*1000;
  
  my $value = $self->{cache}->{$module};
  my $metric = $self->id();


  #print("Class: $module\n");
  #print("Metric: $value\n");
  #print("Time: $diff\n");
  my $cl = $module =~ s/::/./rg;
  print("$cl;$metric;$value;$diff\n");
   
  return $value;
}

sub calculate {
  die("Not implemented. Override in subclasses");
}

1;
