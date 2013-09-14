package Epoch::Tags;
use strict;

use MT;
use MT::Plugin;
use Time::Local qw( timelocal );

sub current_epoch {
	my ($ctx, $args, $cond) = @_;
	return time;
}

sub time_to_epoch {
	my ($ctx, $args, $cond) = @_;
	my $time = $args->{ time } or return '';
	if ( $time =~ /^\d{14}$/ ) {
		return '' if (($time < 19011213204552)||($time > 20380119031407));
		(my $sec = $time) =~ s/^\d{12}//;
		(my $min = $time) =~ s/^\d{10}(\d{2})\d{2}$/$1/;
		(my $hour = $time) =~ s/^\d{8}(\d{2})\d{4}$/$1/;
		(my $mday = $time) =~ s/^\d{6}(\d{2})\d{6}$/$1/;
		(my $month = $time) =~ s/^\d{4}(\d{2})\d{8}$/$1/;
		$month -= 1;
		(my $year = $time) =~ s/\d{10}$//;
		$year -= 1900;
		return '' if (($sec > 59)||($min > 59)||($hour > 23)||($mday > 31)||($month > 11));
		my $sec_from_epoch = timelocal($sec, $min, $hour, $mday, $month, $year);
		return $sec_from_epoch;
	}
	return '';
}

sub differ {
	my ($ctx, $args, $cond) = @_;
	my $blog = $ctx->stash('blog');
	my $from = $args->{ from } or return '';
	my $to = $args->{ to } or return '';
	my $from_epoch;
	my $to_epoch;
	if ($from == 'time') {
		$from_epoch = time;
	} else {
		if ( $from =~ /^\d{14}$/ ) {
			return '' if (($from < 19011213204552)||($from > 20380119031407));
			(my $sec = $from) =~ s/^\d{12}//;
			(my $min = $from) =~ s/^\d{10}(\d{2})\d{2}$/$1/;
			(my $hour = $from) =~ s/^\d{8}(\d{2})\d{4}$/$1/;
			(my $mday = $from) =~ s/^\d{6}(\d{2})\d{6}$/$1/;
			(my $month = $from) =~ s/^\d{4}(\d{2})\d{8}$/$1/;
			$month -= 1;
			(my $year = $from) =~ s/\d{10}$//;
			$year -= 1900;
			return '' if (($sec > 59)||($min > 59)||($hour > 23)||($mday > 31)||($month > 11));
			$from_epoch = timelocal($sec, $min, $hour, $mday, $month, $year);
		} else {
			return '';
		}
	}
	if ($to == 'time') {
		$to_epoch = time;
	} else {
		if ( $to =~ /^\d{14}$/ ) {
			return '' if (($to < 19011213204552)||($to > 20380119031407));
			(my $sec = $to) =~ s/^\d{12}//;
			(my $min = $to) =~ s/^\d{10}(\d{2})\d{2}$/$1/;
			(my $hour = $to) =~ s/^\d{8}(\d{2})\d{4}$/$1/;
			(my $mday = $to) =~ s/^\d{6}(\d{2})\d{6}$/$1/;
			(my $month = $to) =~ s/^\d{4}(\d{2})\d{8}$/$1/;
			$month -= 1;
			(my $year = $to) =~ s/\d{10}$//;
			$year -= 1900;
			return '' if (($sec > 59)||($min > 59)||($hour > 23)||($mday > 31)||($month > 11));
			$to_epoch = timelocal($sec, $min, $hour, $mday, $month, $year);
		} else {
			return '';
		}
	}
	return $to_epoch - $from_epoch;
}

1;