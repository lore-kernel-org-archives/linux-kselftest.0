From: pvorel@suse.cz (Petr Vorel)
Date: Mon, 8 Apr 2019 14:29:01 +0200
Subject: [RFC PATCH 0/2] Kselftest shell (or even C) API
In-Reply-To: <1554725685.17244.61.camel@linux.ibm.com>
References: <20190406214915.16914-1-pvorel@suse.cz>
 <1554725685.17244.61.camel@linux.ibm.com>
Message-ID: <20190408122901.GA6493@dell5510>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190408122901.1U_FVXNNn2aHdx5MDG6YcOX10joEglesVHVLoFDPmHE@z>

Hi Mimi, Shuah,
> Hi Petr, Shuah,

> On Sat, 2019-04-06@23:49 +0200, Petr Vorel wrote:
> > Hi,

> > this is a draft trying to define some API in order to remove some
> > redundancy from kselftest shell scripts. Existing kselftest.h already
> > defines some sort of API for C, there is none for shell.

> Shuah, when the tests were in the selftests/ima directory I was
> planning on including them in my pull request; and then they moved to
> selftests/kexec.  As they were still IMA related, I was still
> shepherding them and planned on including them in my pull request. (Is
> this Okay?  Your Review/Ack would be much appreciated.)  This patch
> set, however, introduces a set of "common" set of kselftest functions.

> Originally, you suggested deferring defining a set of "common"
> kselftests functions to prevent delaying upstreaming the tests.  With
> these patches, that time is here.  How do you want to handle this?

I agree with separation of common kselftests functions / proper API effort.
kexec tests are ready and IMHO should not be delayed with this effort.
"common functions" proposed by this patchset are more for to start a discussion
about it, what I brought doesn't help much. Proper design takes some time.

> Thanks,

> Mimi

Kind regards,
Petr
