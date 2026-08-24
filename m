Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157125782D
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 21:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787608123; cv=pass; b=C7QJGqm0xLciE/Jko0qFJ9nQ8TC1Z0ejNTbXFDZ8vZdrlfdqa3Swnp+1OOdkhTvf1dIDUlqAHTOX80gzZJObVyvRqSn2sdcDvvrFZsrW8y7i7n3MwpGiF8li5WFSUo29aatbSHrmckyzUUWa77E1WVfjpG52szAQ767v1T8wzs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787608123; c=relaxed/simple;
	bh=eLMQbpU4Lf2Oco03hnjJLH7SndBPsL+91LpDFe8h9Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AroYW7t4eW2ulmXlY2qjzC3nwL0KNhBdlkSV9Mh5sutYIRNbO09TAxieAUwzhqy1FTfTJ5PXn0b2gy+zp7yHm9UuPWvB24Bj8BUCv2eGlvulGAKb7exe4WzsKhwWj5+EgpZgJm+SpMnqNjxLwo1xpU2JbJnx/6asFr9X+Ch0DEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qESfhQqd; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qESfhQqd"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so2916542a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 14:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787608122; cv=none;
        d=google.com; s=arc-20260327;
        b=S3IwLalYi4dFUzTbMZrPzyImiaqa/t2QhXWeYuJo2ttToniFdChqxnKZvsGJ4JDFnf
         PnUBWvuX5hg4y3mVxlQ5jxMppIPlIMl3rwJ2b67gOQKJQd47eO87ElAzTZLgB1TqwCjN
         TqoeCPkMDk2EN6jHyWbXceNXMYohmF3/uUm1mbmLD2EsMfkZZbC/rETuk/hPe/OBLo4V
         5laOdmaT9Sm4932wzGnoKBp4RVFC30/QtJGy+1DKlpJuK5eRo0Wd1ttMurZwWrsTsRty
         dr2dG4fSzKlC7tPYWg9VCVqoKcWUFzA3eRys9x6yYnPXCXCT/w85ij5Ns9tKS7DAQpr+
         PPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NLWtcrxu1k5qOJ0bmcu7wDHHxh7XkDSRlD2ohwkIbD0=;
        fh=g3VLpC5KSW14sc6WrLO+VI+JELFuj9wNHxSxTTsR4zk=;
        b=PjJGWsGcze+nvZ4kCfUejobe2cWfkuLTjZS7hmi92crP3sJ17IZfICB0N5aprnbr8L
         +8KE+KioOUKWnbNLHpGECSVDC2RLp33DSYKaq/jqXzsgTjggXWksBkUEYI48858gjNAI
         SHgOFAGruz+krlZ+RyVmyxB31yw2HC+gY6kzBTCU3poBIe2BVPEG/sGBetPKIm1pLffs
         8FFptpVgoa2dvZN27Jf6/oIsu7TGeol+G+OLVuId+J8copYLIyPMqlsNZx8yj2hAj0zV
         k9s9mk9ei8/PIrQd/WKeUQTCaWX0kYA/kwRPvrmxChbR4aQJDq3bu+yxzZYZFDQcrwxq
         gkFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787608122; x=1788212922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NLWtcrxu1k5qOJ0bmcu7wDHHxh7XkDSRlD2ohwkIbD0=;
        b=qESfhQqdCTQZX6hlgHUpcrcUUIIglw6uHPLdp7/GALYuxWXYX3wL9B9z2OSrPmpGac
         Rk7buXRwxjwzQM6CQZgDC/7y+1K4ewgDtZ1FaeLev8gp4dpU8PZW3pB7NScT5DY2MuCi
         IzyyEi5Es6PHSpr4hFh6E09YZLK1qC8mpzwOtFs6IW+7y1ZXPNz4lLQ9CLeUwDo17Ud0
         m5VStajJ+gd89kLsMpN08yCPjzeptCy/56nXiE44Z5zfmMu8xav+NphZI8f/bNw1ktif
         KkAb3SW2/N7fca6kKObymPFUhx/aAmc3D6KJ7r/eFfeqHVmX8QHB5/MWP1GlR9msbYBK
         Ftdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787608122; x=1788212922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLWtcrxu1k5qOJ0bmcu7wDHHxh7XkDSRlD2ohwkIbD0=;
        b=Z9kJI3zqd7Lz9IT1zshLNyY6CYOhgs1uka52Do2k0dxPV2rj13dK+xql9pAiF7znM+
         qEVi0Ftte9gjfwCUaT7ejFo/Ut3/f81bq+4cJvW+UbvPv0Ca9El37REsaRlmXqxPLhgS
         j3PZ9pW0gJt6UXeHWXiWWMEJOXnXSsgp5IK+2w4Y2jCGsBovfy4UxTQ7m8PZKKkj1Jlo
         tlMdQxJx56VECIKPh5GM+CRHPB9NX00ZwrQeNTxYcGQaEEfd2o2LMplf13lpw7D4HQY5
         aBPtuyvB4qh4d7BhmFLisMhGDosLc7r5ykKnsan0E6I0tyMv7f78I9l0WhQnzsLWJSr1
         lI/A==
X-Forwarded-Encrypted: i=1; AHgh+Rpbcxug6RAn8P3u+OyACyv1myh9nQidlPGw6BlOy7u1a6yVBp5PgjaFg+kQUef7VCMikUpxKnpsrHLdumQnqQw=@vger.kernel.org
X-Gm-Message-State: AFuF++nWOe/kUG+bd1CVbht6he7Q6lXhh41vVn/EBFqLcRNRkA02mdKh
	lYHdN1+HkNhTDC+/zxKEf5M+mmKdl3pV/ujYJ8s7dbqKmWvkC9aZ5MRgHjHXd/WIb+RI6Zxq+uJ
	mW4labJ/65oVqKh6ZVCCX+eOiOL8Bp6Hq3BkbB1Y=
X-Gm-Gg: AR+sD11vbZDQh1bRqwQGHrLlg9VXJeS8CPgL7W+dPvwNv4AEtPAnpKKwZohwOBbrLUg
	QPHFwf5jnkGzioyx4ddcTis4Mk8TRYZg42H/85kggnQSUa0G8GN2mppRVHUT+8g5B78/QstvaCB
	5z0bsPA57sb4YOMaHBOhJNbBCtDqQVr6hQ5dHSYKkrkascpc7ExKOFTi/cpyp8sxCAhIaheRAqD
	DC423rsSUdmAbKkcEVG76ufP7m2OizOSZiUAp6QuebVCpIqtvsDWRq7EVxEs/eTf7yDfBwBbkss
	xQFbOq/6PJP6vac3neHb7o7t5VBuwCO8CfQMxjyp3aJkjnbfgeYafA5lfyocXum50uPdcBHzA5J
	sL0EbAqEJmpyWslxrIdXgExnfig0J66Yz9Qcgy14yZ4+NiiLO0DXAokomG7H3YPGxh/waXBT/
X-Received: by 2002:a05:6a20:d52d:b0:3cd:602e:f8ab with SMTP id
 adf61e73a8af0-3cd90fbdaf4mr3772301637.4.1787608121518; Mon, 24 Aug 2026
 14:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
 <20260817130239.343594-2-haakon.bugge@oracle.com> <CANDhNCoPDZeXXGn-hKZ_jgE8gkELEaufDXDYWV=hqLWxtD6gJg@mail.gmail.com>
 <2FB8E129-0EC5-4593-9853-D528854AAA4B@oracle.com>
In-Reply-To: <2FB8E129-0EC5-4593-9853-D528854AAA4B@oracle.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 24 Aug 2026 14:48:30 -0700
X-Gm-Features: AcwNN1U8wtCkRfVcuG5Zc9ouATORyZ8dnDuSovIiH3uTIGQOXwcfNCd094kuSjE
Message-ID: <CANDhNCq4k=-Ap-0DUwZTzTCZTTkic3X39vNEpNMi5dCzXLPOXw@mail.gmail.com>
Subject: Re: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:29=E2=80=AFAM Haakon Bugge <haakon.bugge@oracle.c=
om> wrote:
> > On 21 Aug 2026, at 22:42, John Stultz <jstultz@google.com> wrote:
> >
> > On Mon, Aug 17, 2026 at 6:03=E2=80=AFAM H=C3=A5kon Bugge <haakon.bugge@=
oracle.com> wrote:
> > > diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
> > > index cee1901d4cff8..240084b4abbb7 100644
> > > --- a/kernel/locking/Makefile
> > > +++ b/kernel/locking/Makefile
> > > @@ -38,3 +38,4 @@ obj-$(CONFIG_QUEUED_RWLOCKS) +=3D qrwlock.o
> > > obj-$(CONFIG_LOCK_TORTURE_TEST) +=3D locktorture.o
> > > obj-$(CONFIG_WW_MUTEX_SELFTEST) +=3D test-ww_mutex.o
> > > obj-$(CONFIG_LOCK_EVENT_COUNTS) +=3D lock_events.o
> > > +obj-$(CONFIG_MX_TEST) +=3D mx_test.o
> >
> > Total bikeshed item, but both CONFIG_MX_TEST and mx_test are not very
> > obvious names for someone looking at this make file.
>
> I am terrible with names. It's short for Mutual eXclusion. Can of course
> be spelled out if preferred.
>
> [snip]
>
> > Apologies, I've not had a chance to apply and try this yet.
>
> NP.
>
> > So this looks like the test has to be run via module load?
>
> It can be run built-in as well, but then only the default test is run.
>
> > I almost
> > never use modules in my test environment, so its often nice to allow
> > it to be built in and be triggered/re-triggered without having to
> > unload/reload (assuming this is not something like locktorture which
> > never finishes - and if that is the case, it might be good to
> > integrate into the locktorture framework instead of adding a new one).
>
> No, this selftest terminates.
>
> The script, tools/testing/selftests/locking/mx_test.sh, is written to
> be robust wrt. module load/unload failures. The reason I prefer to run
> it as module, is the turn-around time. From an edit, it takes
> literally only a second to compile the module out-of-tree, another
> second to copy it to the *updates* on the test server.

Yeah, I can see the benefit in the case where you're testing on the
machine you build with.  However, I've found in cases where you're
building on a different machine then your testing with, modules can be
more of a pain to work with.

That's why I've added sysfs interfaces to some tests (test-ww_mutex,
and my out of tree ksched_football), so this sort of
module-load-time-testing can be repeatedly re-triggered in a static
build config.

> But if the community prefers that all the tests are run when the test
> is built-in, the loop looping though the eligible tests can be moved
> from the script to the C source instead.

I'm not sure if there's a clear community preference. Especially as
some thought is probably needed as to the sysfs conventions, as
littering /sys/kerenel/ with a bunch of test driver interfaces might
not be a great long term solution.  But this was just something I
wanted to raise, as I've found it useful, especially when issues only
show up after many many iterations of the test.

thanks
-john
