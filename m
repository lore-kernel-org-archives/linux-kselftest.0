Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02798283C89
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 22:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208880; cv=pass; b=G06jLI/QuF5lfO7ddafTS7zl0ksS1Fze2E+4gZu6Nh9wK5H2hiKqqLpa+afT1tOsl3Mo6pcSMYhWENdSj9qgChiQqT1WeK1SVnxNYgfiPzYZjvHwUP5UJ3OvhUWcwjxq8zdUswxu0M7jsPkBim9PqggUy+Wp/85nj5ul6VBLutM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208880; c=relaxed/simple;
	bh=VldxMb4kLeZCJLUNoWpFhluPeX7IeEzpYKxYC2DNOyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=diayPR8XDTZLlHMkXapcJkdgzWzwBYbAvS31w2JiRyO6weE9yWgmF3C42vRJ4sFF0ZQJoScp1E8IhJU2Qp+xpueQIuDtgPUkZA9hWCnEGGwo5A7aMXfRr5a8Fiz7FaspqxkXt2fY2gGHOQROf/x+K6jVch97jWdDkI7dgPpfl/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9jDmZCc; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9jDmZCc"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b71515d8adso2742409eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 14:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769208868; cv=none;
        d=google.com; s=arc-20240605;
        b=W506Q7uCKGLadvszayQYVSfdnvaIfx5Vaxd1Nc1V7BtmuladrPJ22h4mhhHcjVh+HF
         yT6gVWyRgm9lzaHkIKNJrRt6Z6ZDyfZ5OdPTLrCe3VzXmk5lCgO0MsmMJqDskiRYQ4W2
         mBYqSygCgwnWcvt8v3LcadzorHVxHJ6V3syX7uEX2k0LL/nLTqSPhT0WymfTvSSEZi86
         YF629Rzmqpih4Jqr59ISAwhesQBbzftDH5xwtxEXfmpcCEgFnFfasYUBvTL1IxYozHp+
         jIHSdpzntsLkKJdPb+fKT38y+eSHgSC4e3xc8y9J3kUx5JsvTpSMbmiM7Hnky1Y2I98o
         1OCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDcIyM6dRIZ8Bjv67FvDZaFkSGXxbbjQiJ33Culq89E=;
        fh=K85oIsAiz9hosrLlup6ZGGzZI8KtnYJc3x0fKUZw4Tc=;
        b=XjVF2iXYDXlElXVt6xUfnvJdttpLTcbSRAN13Jdh9oRcE4eAJw6vR0zXYSyOHonZfa
         SHNcoRrxswlpwmCLa5V2gqvzWpFutWJ14Xjg9eIV9Z8xEz53QWw9c3tJ8XqHKNe2lHrj
         idJKZDcDG4rJg7fPdprBuVCMbkInLMX5L/LQPVAd+veCgo6OjlWNeaH1vZT/5srd4OI+
         5JD+OFj7Vsnst34LaUvEvnSqPufv8zL1xjMjsGjIgTjiXaixH4xFliQH/PTvHsYmV3s4
         QL+fW5Df7KW5vhDt/qHTxmIh3gI2NFkI5KLfdJIf2oDIdjZ5puWHgSpnzn8rIgeNKk0u
         0Z+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769208868; x=1769813668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDcIyM6dRIZ8Bjv67FvDZaFkSGXxbbjQiJ33Culq89E=;
        b=j9jDmZCc0NU348g+Kfs42PDPWjkashiFk7uFSmOV4Tk2plna0ZZ2M7PGaUFFGht5PW
         tPx99pTQ+h00USme/+2f1A8ZNK9qCcGIOj1TLPGDwv1q0SR6L9Ryf6ikpbkKiy4znjX0
         HSKXq8PcrKc2TTzEOjxnMhaqdGByq9i+rBfn7cVZxy5w6lZXsbnORS5JpZp+AKp1+PYu
         xkSmN3LgWSp1QtIA5vF8cqDZQLXaD50PHcujDWQinQGAKhYYAqEWJ/smMkORs8eumv7W
         CA4UUSok6IXHMxxf07H/rUYgyWETyAOm8igpepSl3vPixDrpIE6LMUsmUOgsPCFWpbLJ
         cPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769208868; x=1769813668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDcIyM6dRIZ8Bjv67FvDZaFkSGXxbbjQiJ33Culq89E=;
        b=WjD4vPoGe6EbDed9b6kzGdvWfnEmi++fETgsN49o69HKD+yzgwXiA1urtyl/RirepI
         H3NJxYEFIB8aw/MKJwvNdf5j+gfPhE2ZxPyujBofQA9okYcIEg0UEEBS3grzZ4lKpI/4
         Vi82u1Tv3PALOUMuyRAGBl16K1Qx4pWo4nQhldKU8FjrJ2NAIScQh67r7ZkcDjmWJtc1
         Tb70LAHCnN6ZPZrvP5t6/hZEd0C/zsVdvWOWsSKN/t79tnMs13V4R8HjIDp/PseS2Sne
         5lyNckP6+W9zgWRYnOiyj+j99CI4Jxqby9C/8OPfBdOvVLcGXrUUvWGPmBjvxK6TFeKY
         ocrg==
X-Forwarded-Encrypted: i=1; AJvYcCUgM7F02rT90DmjMsMVjbf+mExSP/x6jxcooi+XiUysmge5cYWYu3Nzee1WVu42SE+JcMZFITIyKELtaXlcWQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXVTbkPJASu8M864te0oc677Jd2j9NsZmlpGLNagJ5EtgIgD3
	xfCcJkLENbgoa0nhmO/bHB2rMsty0i+TxwdJ6fG4GK0V9m1M4JKyB1FbtJ5v9/3yV7iq2L1ptuA
	0j8ZYelGooYtN1gvof2KOIC8tG738o+s=
X-Gm-Gg: AZuq6aLp81vgC3Dx0LuWWq/bp5Vuoymfev8T7i6lwGOu/BY7i7fPZjhagBoVh6j7KzD
	AKmG/Zk6n4973mA2Ti3GJCXc86ITvPv0yoIjXIPjXnpd2xvODCdH0PO2qqDdRbRFaTAes5ETu6Z
	jOMQXuPdswToK+Z/5/43PMqb6pfqVPhIDZZCV8AjfHolXihh/s/KHF7PhhG06BrAHslAYQ8/o9t
	RdtA9r3hmQY+j9/Yoh9bFOP9eBoQmyj88ryjUmLNVuzhbP23lrsSgWBc/8crsz6DFaQNrj4O+pK
	YD6LQR3hhKtidyXxq1choHv9nCfPBQ==
X-Received: by 2002:a05:7300:724d:b0:2b0:4902:c55c with SMTP id
 5a478bee46e88-2b7399b4a2emr2603459eec.18.1769208867539; Fri, 23 Jan 2026
 14:54:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220204811.3539836-1-alex.t.tran@gmail.com> <38r99s88-7pp2-6s6n-2148-34s5rrs4s225@xreary.bet>
In-Reply-To: <38r99s88-7pp2-6s6n-2148-34s5rrs4s225@xreary.bet>
From: Erin Skomra <skomra@gmail.com>
Date: Fri, 23 Jan 2026 14:54:16 -0800
X-Gm-Features: AZwV_QipwUq4Ba9n1mG_aQw33uy5jMZwoGwSVewSb4PfIh6xNn40fGEqPKfYZcM
Message-ID: <CAEoswT3Ft=XSeogfob0aitGkUEQY2dqoYcjT1CbeGWwFAsA+KQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] selftests: hid: tests: test_wacom_generic: add
 tests for display devices and opaque devices
To: Jiri Kosina <jikos@kernel.org>
Cc: Alex Tran <alex.t.tran@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>, shuah@kernel.org, 
	linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all and thanks so much to Alex for the patch.

We tested and reviewed the patch and everything looks good with one suggest=
ion.

Since the properties are mutually exclusive we'd like you to add one
line to each prop test asserting that the opposite property is NOT
set.

Thanks again,
Erin Skomra
Software Engineer II at Wacom


On Sat, Jan 10, 2026 at 1:20=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Sat, 20 Dec 2025, Alex Tran wrote:
>
> > Verify Wacom devices set INPUT_PROP_DIRECT on display devices and
> > INPUT_PROP_POINTER on opaque devices. Moved test_prop_pointer into
> > TestOpaqueTablet. Created a DirectTabletTest mixin class for
> > test_prop_direct that can be inherited by display tablet test classes.
> > Used DirectTabletTest for TestDTH2452Tablet case.
> >
> > Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
>
> Let me CC Benjamin and Wacom folks to take a look here as well.
>
> > ---
> > Changes in v2:
> > - Removed the tests from the BaseTest class
> > - Removed disabling tests for certain subclasses
> > - Moved test_prop_pointer under TestOpaqueTablet
> > - Created DirectTabletTest mixin class
> > - Moved test_prop_direct under TestDTH2452Tablet
> >  .../selftests/hid/tests/test_wacom_generic.py | 30 +++++++++++--------
> >  1 file changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/tools/testing/selftests/hid/tests/test_wacom_generic.py b/=
tools/testing/selftests/hid/tests/test_wacom_generic.py
> > index 2d6d04f0f..9d0b0802d 100644
> > --- a/tools/testing/selftests/hid/tests/test_wacom_generic.py
> > +++ b/tools/testing/selftests/hid/tests/test_wacom_generic.py
> > @@ -598,18 +598,6 @@ class BaseTest:
> >                  if unit_set:
> >                      assert required[usage].contains(field)
> >
> > -        def test_prop_direct(self):
> > -            """
> > -            Todo: Verify that INPUT_PROP_DIRECT is set on display devi=
ces.
> > -            """
> > -            pass
> > -
> > -        def test_prop_pointer(self):
> > -            """
> > -            Todo: Verify that INPUT_PROP_POINTER is set on opaque devi=
ces.
> > -            """
> > -            pass
> > -
> >
> >  class PenTabletTest(BaseTest.TestTablet):
> >      def assertName(self, uhdev):
> > @@ -677,6 +665,13 @@ class TestOpaqueTablet(PenTabletTest):
> >              uhdev.event(130, 240, pressure=3D0), [], auto_syn=3DFalse,=
 strict=3DTrue
> >          )
> >
> > +    def test_prop_pointer(self):
> > +        """
> > +        Verify that INPUT_PROP_POINTER is set on opaque devices.
> > +        """
> > +        evdev =3D self.uhdev.get_evdev()
> > +        assert libevdev.INPUT_PROP_POINTER in evdev.properties
> > +
> >
> >  class TestOpaqueCTLTablet(TestOpaqueTablet):
> >      def create_device(self):
> > @@ -862,7 +857,16 @@ class TestPTHX60_Pen(TestOpaqueCTLTablet):
> >          )
> >
> >
> > -class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, Touch=
TabletTest):
> > +class DirectTabletTest():
> > +    def test_prop_direct(self):
> > +        """
> > +        Verify that INPUT_PROP_DIRECT is set on display devices.
> > +        """
> > +        evdev =3D self.uhdev.get_evdev()
> > +        assert libevdev.INPUT_PROP_DIRECT in evdev.properties
> > +
> > +
> > +class TestDTH2452Tablet(test_multitouch.BaseTest.TestMultitouch, Touch=
TabletTest, DirectTabletTest):
> >      ContactIds =3D namedtuple("ContactIds", "contact_id, tracking_id, =
slot_num")
> >
> >      def create_device(self):
> > --
> > 2.51.0
> >
>
> --
> Jiri Kosina
> SUSE Labs
>
>
