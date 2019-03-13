From: pvorel@suse.cz (Petr Vorel)
Date: Wed, 13 Mar 2019 11:14:36 +0100
Subject: [PATCH v3 5/7] selftests/ima: kexec_file_load syscall test
In-Reply-To: <1552409474.24794.63.camel@linux.ibm.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
 <1552304473-3966-6-git-send-email-zohar@linux.ibm.com>
 <20190312121001.GA18510@dhcp-128-65.nay.redhat.com>
 <1552409474.24794.63.camel@linux.ibm.com>
Message-ID: <20190313101436.GB25643@dell5510>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190313101436.XLNn8ZN_-7k52vZSc3KSG6mz5rK-nM9Pen72aC93T78@z>

Hi Mimi, Dave,

> > Frankly I did not read and followup much about the testing code changes,
> > not sure if it is doable or not.  The code sharing under testing folder
> > seems not very good.  For example the basic check_root is needed by
> > different parts, but all have its own implementation.  Anyway this is
> > not the duty of this patch set.
> > Also the selftests/lib/ is not a folder for sharing code for different
> > tests, it looks a standalone test instead.
Yes. Thus lib/ folder name is a bit confusing.

> Shuah suggested upstreaming these tests first and defer introducing a
> common set of functions to later.
Make sense.

> > So if split kexec tests to another folder is not doable please just
> > ignore the comment.

> Left in the selftests/ima is a similar test for kernel modules, which
> uses the "common" functions.  So either we wait to move the kexec
> tests or allow them to reach into the ima directory and use the
> ima_common_lib functions.
I guess just load ima_common_lib.sh for now would be good enough.
@Dave: BTW I has starting to work on kselftest common library.
I thought I'd spent some time on it before posting it, but I might even send
the small part I've done so far so we can discuss it.

> > BTW, does CONFIG_KEXEC* is checked?  in case a kernel without KEXEC or
> > KEXEC_FILE compiled in then the tests can just return directly.

> Good point.  Now that there is a common function for reading the
> Kconfig, I'll add that check to both the test_kexec_load.sh and
> test_kexec_file_load.sh tests respectively.

> Mimi


Kind regards,
Petr
