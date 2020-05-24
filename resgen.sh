#!/bin/sh
echo -n "NAME: "
read NAME
echo -n "EMAIL: "
read EMAIL
echo -n "PHONE NUMBER: "
read PHONE

echo "NOW CONSTRUCTING SKILLS..."
SKILLS=""
while :
do
	echo -n "ADD SKILL (EMPTY TO SKIP): "
	read TEMP
	[ "$TEMP" = "" ] && break || SKILLS="${SKILLS}\n.IP \\(bu\n${TEMP}"
done

echo "NOW CONSTRUCTING EXPERIENCE..."
EXPERIENCE=""
while :
do
	echo -n "ADD EXPERIENCE (EMPTY TO SKIP): "
	read TEMP
	[ "$TEMP" = "" ] && break || EXPERIENCE="${EXPERIENCE}\n.IP \\(bu\n${TEMP}"
done

echo "NOW CONSTRUCTING PERSONAL PROJECTS..."
PERSONAL_PROJECTS=""
while :
do
	echo -n "ADD PROJECT (EMPTY TO SKIP): "
	read TEMP
	[ "$TEMP" = "" ] && break || PERSONAL_PROJECTS="${PERSONAL_PROJECTS}\n.IP \\(bu\n${TEMP}"
done

echo "NOW CONSTRUCTING EDUCATION..."
EDUCATION=""
while :
do
	echo -n "ADD DIPLOMA/DEGREE/&c. (EMPTY TO SKIP): "
	read TEMP
	[ "$TEMP" = "" ] && break || EDUCATION="${EDUCATION}\n.IP \\(bu\n${TEMP}"
done

echo -n "IS THIS YOUR FIRST JOB IN THIS FIELD (y/N)? "
read PROJS_FIRST

[ "$PROJS_FIRST" = "y" ] || MS=".TL\n${NAME}\n.2C\n.SH\nContacts\n.IP \"Email\"\n${EMAIL}\n.IP \"Phone Number\"\n${PHONE}\n.SH\nSkills\n${SKILLS}\n.SH\nExperience\n${EXPERIENCE}\n.SH\nPersonal Projects\n${PERSONAL_PROJECTS}\n.SH\nEducation\n${EDUCATION}" && MS=".TL\n${NAME}\n.2C\n.SH\nContacts\n.IP \"Email\"\n${EMAIL}\n.IP \"Phone Number\"\n${PHONE}\n.SH\nSkills\n${SKILLS}\n.SH\nPersonal Projects\n${PERSONAL_PROJECTS}\n.SH\nExperience\n${EXPERIENCE}\n.SH\nEducation\n${EDUCATION}"

echo "${MS}" | groff -ms -Tpdf > resume.pdf
