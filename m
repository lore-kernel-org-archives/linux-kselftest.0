From: pvorel@suse.cz (Petr Vorel)
Date: Mon, 8 Apr 2019 15:07:50 +0200
Subject: [RFC PATCH 1/2] selftests: Start shell API
In-Reply-To: <20190408113841.GA2418@rei.lan>
References: <20190406214915.16914-1-pvorel@suse.cz>
 <20190406214915.16914-2-pvorel@suse.cz>
 <20190408113841.GA2418@rei.lan>
Message-ID: <20190408130750.GE6493@dell5510>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190408130750.o88QGFp5qpvMhCWVXIPsKCynIK2Oss5UbQyQnSAvMg4@z>

Hi,

> > +ksft_pass()
> > +{
> > +	echo "[PASS] $TEST: $1"
> > +	exit $KSFT_PASS
> > +}
> > +
> > +ksft_fail()
> > +{
> > +	echo "[FAIL] $TEST: $1"
> > +	exit $KSFT_FAIL
> > +}

> I think that the main disadvantage here is that these functions call
> exit instead of storing the results which leads to a common pattern of
> passing the result up the function call chain which is prone to errors.

> What I have learned the hard way over the years is that the result
> reporting should be separated from the functions that exit the tests and
> that the test code should not be trusted with passing the overall test
> result at the end. I've seen too many cases where the actuall failure
> was ignored becaues the failure was lost on it's way to the main
> function.

> Another lesson is that tests shouldn't implement the main() function,
> that is something that the test library should do, which allows for
> resources to be listed in a declarative way instead of calling init
> funcitons at the start of the tests. Which means that in LTP you can say
> "mount at least 512MB device formatted with ext4 to this mount point"
> and all this handled in the test library before the actual test starts.

> As the last point this completely misses a cleanup callback support,
> i.e. function that is called to clean up if you need to exit in the
> middle of a test in a case of an error.

Agree with all mentioned. My patchset was mainly to bring the discussion.
Although library defining some general functions and constants to reduce
duplicity is itself a small improvement, kselftest deserves a proper API.
For both C and shell.

Kind regards,
Petr
