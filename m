Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E53E3164
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653384; cv=pass; b=L5g50JXtyPL75LG1pE+qZI9pFRqjTfXRw1ZCanKQp84XbCcr+C1rFc2YhoRdMY6gLP/DzZjiDaHf+EIWbhrOApVhoak9w1RQhmNaNq6yMpNMh3z6FGEloWY0+mp5f2jx2FTUtusZCkHOm0Yq8oE9jUUg9SfUNN7FT5+Wwhll8Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653384; c=relaxed/simple;
	bh=fXfXk/1LzHnPDWmujicyJbX/mcKGT50kFcQZFxYNjEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5q1EX4UdRNr2IwCu60yQg4frhq2VmX3BYAi6wZSExwBmQp1xlXDJlUH4fPDEvrECtqvdEJUya6QSMupBDYUUWTrR8ypQhhsn5dZtPpIQV2RJbMeP2qNAutAS7eC8FRHaihsmhNZ4Cuf2mYdQPS7x88NjHGeQyvYeuY6+ty81+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DR6Q9Bga; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DR6Q9Bga"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cfe240fb75so63043137.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 02:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780653382; cv=none;
        d=google.com; s=arc-20240605;
        b=cz0UOC7v1ZAGZWyw+GHXEK2nrHsz8pVDhVV1vLhppcj79pjHO42/eqtIU8t4m5ojGS
         1qpB5Ybi9DtFqtdkAlMCfE7F2SEGiF4rfb9AkIqUWliQT2pHQ2MA6lfAjsHlQ0/kiPQV
         jR/ZSqa7Brm3at5K1or2xgJr3auAP2dg19RUD9c5fPtEAi4D/OQAOR6axBV0HTNlNAWR
         CLHjGN9WWXf3HL8pg+dEUkWq6THSsEziTRW2p/LqUpmJBGv9LpiE+hX+oSdwwDex+kJI
         WL6InFxotQ3/5a80voFkS0mrJqdjfDs49vK5UlvEgwnxRu156EkXrJcvM25XQnlavLvX
         KO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=188nvOnCtn3gvAkEJ5AAqju2IjEOtnXumuNth0RPW38=;
        fh=jxNOnkp/YhWUhDKcjkw3NXInBqHZ9i8Z2dMYHgfkMJ4=;
        b=NsJ4aAHH8K2t538EbP55mnL/MdG5vN9Dk8/OV66l7ZME19+kKsmNPgUF5r1Ry04VZ/
         Tn9YpkLq1v0umTyjyyF6fe0eyhs5q1hedGCe3od9sQiWHz4YTATKbUkW5r/iqentMawJ
         F0HBmAC/+OKhD3dC5/zs1I4BSx8SdUsHR7QFkNJCRX4xMktC951cjmuXsh+/a1jgjJAc
         5QUcfWUfe4i96cXzTiBmLR0ICad+fw5TEn9bHMqehHEoCiiBq26jFKEAXoRbh1MdNDRw
         z7pQuIUAYxlXMouN7u7cyKm71qttjUoj/jv3H4+h8u9gLdVEObK6woFX4KfOpbzPzgjB
         hrFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780653382; x=1781258182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=188nvOnCtn3gvAkEJ5AAqju2IjEOtnXumuNth0RPW38=;
        b=DR6Q9Bga7YU+5VbUfy7VH+VTqI5QbjP/1BxzKntud8t14QwouG4lCcTGvYn6XtGpaQ
         zdXBSurEAbb/fdxLRGJkH9H4GeuAlV/KPEVeSxa20ng/HoU1OAr2h7xeerNEBQcAeQj0
         KplCoi2kFfDVvHVt5y38bJdpyArJCJJZ/AUZGiJX5oPT2/fUtHvTwYJOO+2dEI5WicCD
         x+t755iBzFaSBBQiMVOlcARjFrbHDmUseGh0RBHz/8lUuNn3ldkapenL1HMO8N1jW6Mh
         nVUI8bdQRBOAkKYknyKezxQO1c72t7rewtR/KeoWyxbDky9a1cwDyI/3E1SmFwK5+hRq
         4V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780653382; x=1781258182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=188nvOnCtn3gvAkEJ5AAqju2IjEOtnXumuNth0RPW38=;
        b=tN2VVYvoO5ea/7Nr/TRD/ghnY4dyOhP58g6J8OEDx/yA/NCJHpphuzFpSrlQEwn71O
         mmdG9tOr7hkl8oun/taVZnXpPtYJv/q4lqzjNlUzX74hHWX28GojLEniJTuTdkWOWdNf
         b5nNdt6kQ7CUzrFib8DffATDzE0rfXiO74b7vMM07KX9k3n8BLH+n/NoY+PQVBuNE/vm
         lASuZiCuPVtXBHGs5wEiwa58HLsdt/N9vI7zIusLeWIcpNEhWzoDzghDesh0xwWuPKpL
         ylWxH0Iw3VZa9IddCzqcmmmFhr2jfR01ei1yw0mx1Mqa/CSKMqemwrjwXYz2Rb99scvT
         Qnew==
X-Forwarded-Encrypted: i=1; AFNElJ95YQiZu0mjcfmwI4en4MM1gT8BXbV8KdPJ8oxsFOEPNfg/8e1CjA+MBzw+vD0cKvEgtIX0+fWIZxeknkIMpwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj424Ny/I/4IX/0EtKSKshiGsmMdWsegepHDKHCjqIuugASQ2h
	IcPsz7DfDwsNsxqBKmlK3Ea2cgYICYqF5pOlKyqRLgllXOFOuBjBpPKzHNvzkyccA9u5Qx1iZ3B
	8u3ApjDBvlgIc2R7nPcOLq7fsVffUWSA=
X-Gm-Gg: Acq92OEDT4A1Fo2nIEx78ZL0QbcJlAh/FUCpD/z0cck/eAs4Yz8/mgTtDzHGmruV7QL
	AtNKut0VL08q+kBe99aNzK2o5Yr3anZLWGTkOxwIOmJ9+4Qn8zHYA0t6C6qdH7FoDoVOC33B1MB
	Bi8abgzOGiTPidf5uBx0h5ua1IAnBiHeLBPLT3fin/6zu7cqspwRJNBjGOPyzulD3M/eyQneZJK
	Ny5Vttfh7h0LiPd5KneD0+pEJ8GLNx3vDShY8XHZHBh8llbgIxY4vRMC3bhFIqsS+eQIT+HCiPf
	+aae++1DCiK2YeQWB8PozXrImmxL
X-Received: by 2002:a05:6102:c50:b0:60f:77ad:4bed with SMTP id
 ada2fe7eead31-6fefdee6cd8mr293230137.7.1780653381899; Fri, 05 Jun 2026
 02:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524100258.36819-1-saileshnandanavanam@gmail.com>
 <20260524183750.1810-1-sj@kernel.org> <CAF+TLO0TOKr3nef9RnbBuZ8A-jNpV1po26t1BO6JbSqMhfABvw@mail.gmail.com>
In-Reply-To: <CAF+TLO0TOKr3nef9RnbBuZ8A-jNpV1po26t1BO6JbSqMhfABvw@mail.gmail.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Fri, 5 Jun 2026 15:25:48 +0530
X-Gm-Features: AVVi8Cd8y5fFKwqGfXRah25YurCGU1j0bkf9HlQz8Xf8QOU5lKc-yuHMMmkRebY
Message-ID: <CAF+TLO0=zpnAo-Ma2zi-Op=P0w0TPVCLbBkWKq113RDsHaCXuw@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/damon: add regression test for damos_walk()
 vs kdamond exit race
To: SeongJae Park <sj@kernel.org>
Cc: shuah@kernel.org, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi SeongJae,

Apologies for the delayed response.

Thank you for the detailed review and for actually testing the patch
on a kernel with the fix reverted.

You are right that the userspace selftest cannot reliably trigger this
race. The race window between kdamond cancelling requests and
unsetting the pointer is microseconds wide. Since userspace calls have
system call overhead, they cannot hit that window reliably =E2=80=94 which =
is
why the test always passed even on a broken kernel.

Regarding the error condition question:

When kdamond stops naturally, any subsequent write to the state file
(which update_schemes_tried_regions() does internally) fails because
kdamond is no longer running. So receiving an error indicates kdamond
exited without deadlock =E2=80=94 the expected success condition. I should
have explained this more clearly in the comment.

I agree that a KUnit test is the right approach since it runs inside
the kernel and can directly set walk_control_obsolete to simulate the
race condition reliably without timing dependencies.

I will drop the userspace selftest approach and write a KUnit test for
damos_walk() functionality including walk_control_obsolete. I will
verify it fails on a kernel with commit 33c3f6c2b48c ("mm/damon/core:
fix damos_walk() vs kdamond_fn() exit race") reverted and passes with
the fix present before sending v3.

Regarding other feedback:
- Will use correct commit description format with subject in brackets
- Will remove the Fixes: tag
- Will add blank line before _damon_sysfs import
- Will add changelog and link previous versions
- Will share revision plan and wait at least one day
  before sending new version

Please give me some time to study mm/damon/tests/core-kunit.h and
implement this properly.

Thanks,
Sailesh Nandanavanam


On Fri, Jun 5, 2026 at 12:44=E2=80=AFPM Sailesh Nandanavanam
<saileshnandanavanam@gmail.com> wrote:
>
> Hi SeongJae,
>
> Apologies for the delayed response.
>
> Thank you for the detailed review and for actually testing the patch on a=
 kernel with the fix reverted.
>
> You are right that the userspace selftest cannot reliably trigger this ra=
ce. The race window between kdamond cancelling requests and unsetting the p=
ointer is microseconds wide. Since userspace calls have system call overhea=
d, they cannot hit that window reliably =E2=80=94 which is why the test alw=
ays passed even on a broken kernel.
>
> Regarding the error condition question:
>
> When kdamond stops naturally, any subsequent write to the state file (whi=
ch update_schemes_tried_regions() does internally) fails because kdamond is=
 no longer running. So receiving an error indicates kdamond exited without =
deadlock =E2=80=94 the expected success condition. I should have explained =
this more clearly in the comment.
>
> I agree that a KUnit test is the right approach since it runs inside the =
kernel and can directly set walk_control_obsolete to simulate the race cond=
ition reliably without timing dependencies.
>
> I will drop the userspace selftest approach and write a KUnit test for da=
mos_walk() functionality including walk_control_obsolete. I will verify it =
fails on a kernel with commit 33c3f6c2b48c ("mm/damon/core: fix damos_walk(=
) vs kdamond_fn() exit race") reverted and passes with the fix present befo=
re sending v3.
>
> Regarding other feedback:
> - Will use correct commit description format with subject in brackets
> - Will remove the Fixes: tag
> - Will add blank line before _damon_sysfs import
> - Will add changelog and link previous versions
> - Will share revision plan and wait at least one day
>   before sending new version
>
> Please give me some time to study mm/damon/tests/core-kunit.h and impleme=
nt this properly.
>
> Thanks,
> Sailesh Nandanavanam
>
> On Mon, May 25, 2026 at 12:08=E2=80=AFAM SeongJae Park <sj@kernel.org> wr=
ote:
>>
>> Hello Sailesh,
>>
>> On Sun, 24 May 2026 15:32:58 +0530 Sailesh Nandanavanam <saileshnandanav=
anam@gmail.com> wrote:
>>
>> > Add a regression test that verifies damos_walk() does not deadlock
>> > when racing with kdamond_fn() exit.
>> >
>> > When kdamond_fn() finishes its main loop, it cancels remaining
>> > damos_walk() requests and unsets damon_ctx->kdamond. Without the fix
>> > in commit 33c3f6c2b48c, damos_walk() could be called right after
>>
>> Please use more common commit description format that has the commit sub=
ject.
>> E.g., commit 33c3f6c2b48c ("mm/damon/core: fix damos_walk() vs kdamond_f=
n()
>> exit race").
>>
>> > cancellation but before kdamond pointer unset, causing it to wait
>> > forever for handling that never comes.
>> >
>> > The test starts kdamond monitoring a short-lived process, waits for
>> > the process to exit naturally triggering kdamond termination, then
>> > rapidly calls update_schemes_tried_regions in a separate thread to
>> > hit the race window. Using a thread with join timeout ensures the
>> > test can detect kernel-level deadlocks where the system call blocks
>> > in uninterruptible state.
>> >
>> > The sysfs state path is resolved dynamically via the kdamonds object
>> > instead of being hardcoded, and exceptions are handled specifically
>> > as OSError rather than using a bare except block.
>>
>> Thank you for this patch.  But, is this test reliable?  I ran the test m=
ore
>> than 100 times on my system running a kernel that has commit 33c3f6c2b48=
c is
>> reverted.  But test always passed.
>>
>> >
>> > Fixes: 33c3f6c2b48c ("mm/damon/core: fix damos_walk() vs kdamond_fn() =
exit race")
>>
>> This is not fixing a bug in the commit, so the above 'Fixes:' tag is
>> inappropriate and may only confuse people.
>>
>> > Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
>> > ---
>>
>> From next time, please add changelog on the commentary area [1], with li=
nks to
>> the previous revisions.
>>
>> I was able to find the previous version on the mailing list [2], so putt=
ing the
>> link here for others.
>>
>> Also, before sending a new version, please share your revisioning plan a=
nd give
>> time (about a daay) for others to comment about.
>>
>> >  tools/testing/selftests/damon/Makefile        |  1 +
>> >  .../sysfs_damos_walk_kdamond_exit_race.py     | 82 ++++++++++++++++++=
+
>> >  2 files changed, 83 insertions(+)
>> >  create mode 100755 tools/testing/selftests/damon/sysfs_damos_walk_kda=
mond_exit_race.py
>> >
>> > diff --git a/tools/testing/selftests/damon/Makefile b/tools/testing/se=
lftests/damon/Makefile
>> > index 2180c328a825..60c83d6c318e 100644
>> > --- a/tools/testing/selftests/damon/Makefile
>> > +++ b/tools/testing/selftests/damon/Makefile
>> > @@ -20,6 +20,7 @@ TEST_PROGS +=3D sysfs_update_removed_scheme_dir.sh
>> >  TEST_PROGS +=3D sysfs_update_schemes_tried_regions_hang.py
>> >  TEST_PROGS +=3D sysfs_memcg_path_leak.sh
>> >  TEST_PROGS +=3D sysfs_no_op_commit_break.py
>> > +TEST_PROGS +=3D sysfs_damos_walk_kdamond_exit_race.py
>> >
>> >  EXTRA_CLEAN =3D __pycache__
>> >
>> > diff --git a/tools/testing/selftests/damon/sysfs_damos_walk_kdamond_ex=
it_race.py b/tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_ra=
ce.py
>> > new file mode 100755
>> > index 000000000000..8e8006d63926
>> > --- /dev/null
>> > +++ b/tools/testing/selftests/damon/sysfs_damos_walk_kdamond_exit_race=
.py
>> > @@ -0,0 +1,82 @@
>> > +#!/usr/bin/env python3
>> > +# SPDX-License-Identifier: GPL-2.0
>> > +#
>> > +# Regression test for damos_walk() vs kdamond_fn() exit race.
>> > +#
>> > +# When kdamond_fn() finishes its main loop, it cancels remaining damo=
s_walk()
>> > +# requests and unsets damon_ctx->kdamond. If damos_walk() is called r=
ight
>> > +# after cancellation but before kdamond pointer unset, it could wait =
forever
>> > +# for handling that never comes, causing a deadlock.
>> > +#
>> > +# This test verifies the fix by rapidly calling update_schemes_tried_=
regions
>> > +# while kdamond is naturally terminating (monitored process exits).
>> > +# Without the fix (commit 33c3f6c2b48c), this would hang indefinitely=
.
>> > +
>> > +import os
>> > +import subprocess
>> > +import threading
>> > +import time
>> > +import _damon_sysfs
>>
>> Let's add a blank line before _damon_sysfs import, to be consistent with=
 other
>> test files, like sysfs_update_schemes_tried_regions_hang.py.
>>
>> > +
>> > +def call_update(kdamond, result):
>> > +    err =3D kdamond.update_schemes_tried_regions()
>> > +    result['err'] =3D err
>> > +    result['done'] =3D True
>> > +
>> > +def main():
>> > +    proc =3D subprocess.Popen(['sleep', '0.3'])
>> > +
>> > +    kdamonds =3D _damon_sysfs.Kdamonds([_damon_sysfs.Kdamond(
>> > +            contexts=3D[_damon_sysfs.DamonCtx(
>> > +                ops=3D'vaddr',
>> > +                targets=3D[_damon_sysfs.DamonTarget(pid=3Dproc.pid)],
>> > +                schemes=3D[_damon_sysfs.Damos(
>> > +                    action=3D'stat',
>> > +                    access_pattern=3D_damon_sysfs.DamosAccessPattern(
>> > +                        nr_accesses=3D[0, 200]))]
>> > +                )]
>> > +            )])
>> > +
>> > +    err =3D kdamonds.start()
>> > +    if err is not None:
>> > +        print('kdamond start failed: %s' % err)
>> > +        exit(1)
>> > +
>> > +    # Wait for monitored process to die naturally
>> > +    proc.wait()
>> > +
>> > +    # Rapidly call damos_walk() while kdamond is exiting
>> > +    # Use a thread with real timeout to detect kernel-level deadlock
>> > +    deadline =3D time.time() + 5
>> > +    while time.time() < deadline:
>> > +        result =3D {'done': False, 'err': None}
>> > +        t =3D threading.Thread(target=3Dcall_update,
>> > +                             args=3D(kdamonds.kdamonds[0], result))
>> > +        t.daemon =3D True
>> > +        t.start()
>> > +        t.join(timeout=3D5)
>>
>> I'm not sure if this is reliable to trigger the exact race.  As I mentio=
ned
>> abovely, I tried this test more than 100 times on a kernel that having t=
he fix
>> reverted, but I was unable to make the test fail.  If it is that unrelia=
ble,
>> I'm not very sure if having this test is beneficial or just make people
>> confused.
>>
>> If the test has no false positive, maybe having this make sense to
>> opportunistically finding the bug.  But I think the 5 seconds timeout is=
 still
>> not very reliable on some case, and therefore it seems false positive te=
st
>> failure is available.  If that is correct, I think having this test migh=
t only
>> confuse people.
>>
>> I think having damos_walk() kunit test for its functionalities including=
 the
>> walk_control_obsolete might make more sense.
>>
>> > +
>> > +        if not result['done']:
>> > +            print('FAIL: update_schemes_tried_regions hung - '
>> > +                  'possible damos_walk/kdamond exit race deadlock')
>> > +            exit(1)
>> > +
>> > +        if result['err'] is not None:
>> > +            # kdamond stopped cleanly - expected
>> > +            break
>>
>> Is the above if condition correct?  Could you please explain why having =
an
>> error here is expected?
>>
>> > +
>> > +        # Check kdamond state via sysfs using dynamic path
>> > +        state_path =3D os.path.join(
>> > +                kdamonds.kdamonds[0].sysfs_dir(), 'state')
>> > +        try:
>> > +            with open(state_path) as f:
>> > +                if f.read().strip() =3D=3D 'off':
>> > +                    break
>> > +        except OSError as e:
>> > +            print('failed to read kdamond state: %s' % e)
>> > +            exit(1)
>> > +
>> > +    print('PASS: damos_walk() vs kdamond exit race not triggered')
>> > +
>> > +if __name__ =3D=3D '__main__':
>> > +    main()
>> > --
>> > 2.34.1
>>
>> [1] https://docs.kernel.org/process/submitting-patches.html#commentary
>> [2] https://lore.kernel.org/20260524091812.35283-1-saileshnandanavanam@g=
mail.com
>>
>>
>> Thanks,
>> SJ
