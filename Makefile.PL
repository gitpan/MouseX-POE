
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'The Illicit Love Child of Mouse and POE',
  'AUTHOR' => 'Chris Prather <chris@prather.org>, Ash Berlin <ash@cpan.org>, Chris Williams <chris@bingosnet.co.uk>, Yuval (nothingmuch) Kogman, Torsten Raudssus <torsten@raudssus.de> L<http://www.raudssus.de/>',
  'BUILD_REQUIRES' => {
    'Test::Fatal' => '0.003',
    'Test::More' => '0.90'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'MouseX-POE',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'MouseX::POE',
  'PREREQ_PM' => {
    'Mouse' => '0.92',
    'POE' => '1.311'
  },
  'VERSION' => '0.213',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



