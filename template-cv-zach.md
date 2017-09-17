

# $name$


$for(address)$
|  $address$
$endfor$

| Web: [$www$](http://$www$)
| EMail: [$email$](mailto:$email$)
| Phone: $tel$
| Twitter: [$twitter$](http://twitter.com/$twitter$)
| [Google Scholar](https://scholar.google.ca/citations?user=$scholar$&hl=en&oi=ao)
| [Philpapers](https://philpapers.org/profile/$philpapers$)
| ORCID: [$orcid$](http://orcid.org/$orcid$)

## Appointments


$for(appointment)$
### $appointment.place$

$for(appointment.items)$
$appointment.items.item$. $appointment.items.begindate$-$if(appointment.items.enddate)$$appointment.items.enddate$$endif$.

$endfor$
$endfor$

## Education

% Education uses a different field called ``items.''
$for(education)$
###$education.place$, $education.item$, $education.date$
$if(education.info)$
$for(education.info)$
$if(education.info.text)$
% Store certain things in a field called 'text' to allow another field
% for priority.
$education.info.text$

$else$
$education.info$

$endif$
$endfor$
$endif$
$endfor$


## Invited Talks

$for(presentation)$
$if(presentation.invited)$1. $presentation.title$. $if(presentation.host)$$presentation.host$, $endif$$presentation.place$, $presentation.date$.
$endif$$endfor$

## Keynotes

$for(presentation)$
$if(presentation.keynote)$1. $presentation.title$. $if(presentation.host)$_$presentation.host$_, $endif$$presentation.place$, $presentation.date$.
$endif$$endfor$

## Invited Workshops

$for(presentation)$
$if(presentation.workshop)$1. $presentation.title$. $if(presentation.host)$_$presentation.host$_, $endif$$presentation.place$, $presentation.date$.
$endif$$endfor$

## Conference Talks

$for(presentation)$
$if(presentation.conference)$1. $presentation.title$. $if(presentation.host)$_$presentation.host$_, $endif$$presentation.place$, $presentation.date$.
$endif$$endfor$

## Commentaries

$for(presentation)$
$if(presentation.comments)$1. $presentation.title$. $if(presentation.host)$_$presentation.host$_, $endif$$presentation.place$, $presentation.date$.
$endif$$endfor$

## Local Talks

$for(presentation)$
$if(presentation.local)$1. $presentation.title$. $if(presentation.host)$_$presentation.host$_, $endif$$presentation.place$, $presentation.date$.
$endif$$endfor$

## Courses Taught

$for(teaching)$
1. $teaching.title$ ($teaching.number$). $teaching.date$. ($teaching.type$)
$endfor$

## Students

$for(students)$
## $students.type$
$for(students.students)$
1. $students.students.name$, $students.students.thesis$, $students.students.degree$, $students.students.date$
$endfor$
$endfor$


$for(service)$
## $service.type$
$for(service.gigs)$
1. $service.gigs.item$. $service.gigs.date$.
$endfor$
$endfor$
