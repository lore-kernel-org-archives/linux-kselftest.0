From: zohar at linux.ibm.com (Mimi Zohar)
Date: Sun, 10 Mar 2019 13:48:24 -0400
Subject: [PATCH v2 4/5] selftests/ima: kexec_file_load syscall test
In-Reply-To: <20190228220039.GC20335@dell5510>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-5-git-send-email-zohar@linux.ibm.com>
 <20190228220039.GC20335@dell5510>
Message-ID: <1552240104.5062.10.camel@linux.ibm.com>

On Thu, 2019-02-28 at 23:00 +0100, Petr Vorel wrote:

> > +	local keypair1="$2"
> > +	local keypair2="$3"
> > +
> > +	mount_securityfs
> > +
> > +	local ima_policy=$SECURITYFS/ima/policy
> > +	if [ ! -e $ima_policy ]; then
> > +		log_fail "$ima_policy not found"
> > +	fi
> > +
> > +	if [ -n $keypair2 ]; then
> > +		grep -e "^$action.*$keypair1" "$ima_policy" | \
> > +			grep -q -e "$keypair2"
> > +	else
> > +		grep -q -e "^$action.*$keypair1" "$ima_policy"
> > +	fi
> > +
> > +	[ $? -eq 0 ] && ret=1 || ret=0
> > +        return $ret
> return $? is enough here (+ ret was not defined as local and mixing tabs with spaces)

"grep -q" exits with zero if any match is found.  This line inverts
the result so that 1 is returned for found.  v3 will make "ret" local
and fix the tabs/spaces.

Mimi
