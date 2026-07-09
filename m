Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F7364943
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610523; cv=pass; b=ckDWKpvS6+MF+7/se1WtbZTQSxuZY/d/Zj+ZxtufoWNr11yWG100+aRLaUxVTpEeClaQCucTTaok70Av5UBYNK6DiMfIye0uAFDd1zi2xx9O5IfKlS0WZQKMJFxFz56lhvFPl97iv8rAa1tmvKym+DWvZv8YywoWrfzIG0FL2bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610523; c=relaxed/simple;
	bh=iDolcu2mWBl3uEuQAfKWNLBAt748fEeXf9V7/Qg2coE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZK7T295i7Sr267RDaDwRKEd9r2W9Eiv9RMIpy2sOBVzG20BjyrsozKtK+rfEPMWRhkYv9Rq7w7vHzXZKsGM01a5c87R2kzHO/ycSmP7569FMcxZSOZzfANdTrMrkUqPGUp3rmWnP8jARTJHs0Dm4JK1JFh95Ebf/p3JDQujrj+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsqHczED; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsqHczED"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso54058a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 08:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783610521; cv=none;
        d=google.com; s=arc-20260327;
        b=HltHM2WrXZ7y7HzvY4YM20GB5cfOYW6spq24B6leobF7lGnJzq5BWLc2kq20ZSd58v
         1SgwI8jIqv7WeWSHMvpwCyrvXZC5Exu0TXqdYq1eJYKovnY46LGMzSuGQECLIF1FXO5J
         BP6TOdjy6mBI+PtqIFfuoY9p1HTKfg+ao/uSo3xFUeE8IyUvmlNLHqa8VwH6i1VcmoSG
         NJtPrTKZRulOnMIeDH8ptEoscH2niNPVTUCfP6ScugVgLtvY46ZeyARG3I6QYisAWLv2
         v4+lBIlVXsFgPhWywbML5KZSrT8Vb6ckUqGi7lW7P9Ne8T8MemBSP1qAxlL1WvzG3hWi
         nimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hl6Al4OsGwcvHqvs4fyMXGCvJt1Svt3mIHpxW1j8jYM=;
        fh=ulMVKPSGVhphR3aViBKec3OHa4YLGS9vudhAIZpNG9E=;
        b=dBI3R7cNi/R6aSogTN2DM7Zz0AZMJqKIfi3hyRPd1nNiYhWpB1FyOaPtl9IIxlc2Nh
         F3CahPqwRNPKR02EZKPxb11m2qH6C0zRN9vkeNWvfrz5kBiB9iR9raiGDbK+iSXzagC3
         ls9R/ZPoVZRSgicR8YFniNSfJvtzXWOHd5ynT8oacMpOAQRKo8FzTjT+EqtFVla6SjAg
         14PsfEi4Xi42cnzPTHtdFeWJqMVUPXG98K+cSm6fOJCTTEzd9ForfJdITcPUgc0GlM6g
         MeIYnQjfAJsSPD+37bWvE1TNnJU7AtsSX5GZSpjzQEXDC5Jrs1SY2YNxIQRdEBCeVlwy
         uaXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783610521; x=1784215321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hl6Al4OsGwcvHqvs4fyMXGCvJt1Svt3mIHpxW1j8jYM=;
        b=TsqHczEDJldQiZK/ESWR3KqkEm6n9cEFC70RJpD5dXohfFRnFlHO8ST/g0njQFxcI9
         D+ppeeF28wysOQP7cOxXtWEJZlkw4wjN2qbqD0hXlm9ZYR0tOuHXn88MnHR2HBNRr09K
         hyXTgtAGNn8z/KWcjSIowJDRmXJED7XtVfKBINAIpkBaVuG0SsUIQ1wsYz7k7Tdg3N7t
         +p493Ulp4DVQEqRDph2S54h2vHX3TQznLI6lZZQA58/k8PV/2cFTEHODiyBRMwRu+8Vn
         pyZctllTnAdJWreT+tzWfvydtrmu33+WNkL7/uW3KfNpdY0xGfXHxqbJdAifeqZAuB+M
         U6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610521; x=1784215321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hl6Al4OsGwcvHqvs4fyMXGCvJt1Svt3mIHpxW1j8jYM=;
        b=K63GrxvhDIVDscfZlgWokjqMa2DnasujWH7K4iyBEor0pD4TwUOspdxIE6OJZBpEWb
         1aJExJeUuXr4bcI/17WAZF+kqxij7WGT+zo4FY/CrLNcvkTDiniRvIxnqermdV8yhIIG
         szwwPH4tQOIm46NTVt3hADPe7UCGWC/SbjLpWR9ftucLTzwtyVWiL2HA0+k0Zo+4l2f2
         7m1nWEdPu/Clal7i56o1B0W2bGwUDYMvuf9SXXfIgdM0X0a0L6t8zFpR/a2Hj8H3/0ZQ
         zg00qv0fohby4LKI3X4yg3yJZLm/v4ODbg9M4doEyNU7vLfGNku1mpApcVCvAgElFYQe
         mKqA==
X-Forwarded-Encrypted: i=1; AHgh+RoupmQeJfP2oWHDM11KEJYieQX2Lb3h3376NXPZJaasf+EuF0/9zTS3SMNkzG9sb0XioM5VOrXdbMVJsP37G+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAilpUUyTtCzRQfrena7Hkftt9zNfGIQyV5gkYO+AFN9Lksk7j
	Pju14T2MATRF9X5vkpejhlDwAwgpMJ+t23ciVMxoPLbnIiAx76VgliZBK/nnwxsZl3Pt+O4C+6u
	oMKIQA17R0Vq8BOKNc1OkbOMeOjno4uM=
X-Gm-Gg: AfdE7cmC2Re1eTNy4y94b0T4XSKdzLgQSRgbPtq5OaYbEiwPVZCxFBn87/hzoCgn8Xe
	zRSFg8o0OvJ4eiMPdCLI2LR29EKQy49XLWC5dcBAk0M8jq10zdXU5jyIEQ/dgFexj6hWisifQ0o
	BlKjJK1lWEcbiWWC+rcxFXzYkyRispjisZAmzn2FjN+pcPzfr53gaOmaOfoC3awWhN3TD7nZK9U
	hbC/he3dlpfwV3uq/GEbL7gc7MlDEwXBVAoIMhi9hbYnZLcUBgr8sady8xVmKFMS9ipDvE=
X-Received: by 2002:a17:907:c50e:b0:c12:6280:33c9 with SMTP id
 a640c23a62f3a-c15e780ee92mr173767266b.28.1783610520581; Thu, 09 Jul 2026
 08:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709101327.9508-1-royujjal@gmail.com> <2026070925-delay-gauntlet-bc7c@gregkh>
 <CAE2MWk=mm8_bkd54Gv1mdox6rfvx85Dd3AjOCxPz0fPAfyuWYA@mail.gmail.com>
 <2026070954-activist-left-8303@gregkh> <CAE2MWkmcQdhGp3LTMtpgAse3AFcfKcAcpQe89+iijfP5e0w_QQ@mail.gmail.com>
 <2026070948-lively-exchange-a458@gregkh> <CAE2MWkn3L7V3x8i0F-soGLxsBBo_Umgs1pJ3FwCw1OW7=U55zg@mail.gmail.com>
In-Reply-To: <CAE2MWkn3L7V3x8i0F-soGLxsBBo_Umgs1pJ3FwCw1OW7=U55zg@mail.gmail.com>
From: Ujjal Roy <royujjal@gmail.com>
Date: Thu, 9 Jul 2026 20:51:46 +0530
X-Gm-Features: AVVi8CdJgqKVLA2sAn6f7XPums4J2L125q9McUSFj0u2k_NGu-cn3IODEhE9pa8
Message-ID: <CAE2MWk=xfQ1SpkHnVL0Tsru4e=_8xi2XvESs4Lh+=g4cbFEuuA@mail.gmail.com>
Subject: Re: Please backport bridge multicast exponential field encoding fix
 series to 6.1.y/6.6.y/6.12.y/6.18.y/7.0.y
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux Stable <stable@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, 
	bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 8:43=E2=80=AFPM Ujjal Roy <royujjal@gmail.com> wrote=
:
>
> On Thu, Jul 9, 2026 at 7:52=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
> >
> > On Thu, Jul 09, 2026 at 06:35:04PM +0530, Ujjal Roy wrote:
> > > On Thu, Jul 9, 2026 at 6:23=E2=80=AFPM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > > >
> > > > On Thu, Jul 09, 2026 at 06:12:40PM +0530, Ujjal Roy wrote:
> > > > > On Thu, Jul 9, 2026 at 4:34=E2=80=AFPM Greg KH <gregkh@linuxfound=
ation.org> wrote:
> > > > > >
> > > > > > On Thu, Jul 09, 2026 at 10:13:27AM +0000, Ujjal Roy wrote:
> > > > > > > Hi Greg,
> > > > > > >
> > > > > > > Please consider backporting the following bridge multicast fi=
x series to 6.1.y, 6.6.y, 6.12.y, 6.18.y and 7.0.y.
> > > > > > >
> > > > > > > 726fa7da2d8c ("ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and s=
implify calculation")
> > > > > > > 12cfb4ecc471 ("ipv6: mld: rename mldv2_mrc() and add mldv2_qq=
i()")
> > > > > > > 95bfd196f0dc ("ipv4: igmp: encode multicast exponential field=
s")
> > > > > > > e51560f4220a ("ipv6: mld: encode multicast exponential fields=
")
> > > > > > > 529dbe762de0 ("selftests: net: bridge: add MRC and QQIC field=
 encoding tests")
> > > > > >
> > > > > > Why is any of this needed in older kernels?
> > > > > >
> > > > > > And 7.0.y is long end-of-life.
> > > > > >
> > > > > > And why, if this does fix issues, was it not tagged for stable =
to start
> > > > > > with?
> > > > > >
> > > > > > thanks,
> > > > > >
> > > > > > greg k-h
> > > > >
> > > > > I already explained this in the email thread, "Please backport br=
idge
> > > > > multicast exponential field encoding fix series to stable kernels=
".
> > > >
> > > > Sorry, but that's not here (remember, some of us get 1000+ emails a
> > > > day.)
> > > >
> > > > Please explain why patches need to be backported when asking for th=
em to
> > > > be backported.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > Sorry for breaking the thread. I understand your point, I will
> > > maintain this in the future.
> > > How should I send the patchset that addresses the conflicts on 5.10.y
> > > and 7.1.y? Shall I send the conflicts patchset as a series via a
> > > different thread or how? I've never done this before, so I'm asking.
> > >
> > > Here is the explanation for why the patches need to be backported:
> > >
> > > History: The multicast stack currently supports decoding of IGMPv3 an=
d
> > > MLDv2 exponential timer field encodings, but lacks the corresponding
> > > encoding logic when generating multicast query packets. As a result,
> > > query intervals and response codes exceeding the linear encoding rang=
e
> > > can be transmitted incorrectly. This can cause multicast queriers and
> > > listeners to interpret different timing values, resulting in protocol
> > > interoperability issues, membership timeouts, and premature multicast
> > > group expiration.
> > >
> > > Testing: The series adds the missing encoding support for both IGMPv3
> > > and MLDv2 and includes selftests that validate the behavior.
> > > I backported the series to v6.6.123.2 and verified the accompanying
> > > selftests. The selftests fail on the unpatched kernel and pass after
> > > applying the series, demonstrating both the bug and the effectiveness
> > > of the fix.
> > >
> > > Given that this is a protocol correctness issue affecting multicast
> > > query generation, please consider backporting the complete series to
> > > all applicable stable kernels.
> > >
> >
> > But this really seems like a new feature being added, it's not fixing a
> > regression of something that previously worked, right?
> >
> > WHy can't people just update to the latest kernel release to get this i=
f
> > they need it for their environments?
> >
> > thanks,
> >
> > greg k-h
>
> This is a corner case when people set the query timer value higher
> than 128. People usually use the default value and don't change it, so
> they may not encounter this issue. But I found it when I changed the
> value during some extensive validation of protocol timeouts.
>
> If one host doesn't have this fix, clients will observe premature
> multicast group expiration. For example, a set-top box channel might
> disconnect early.
>
> But we can ignore this until few more people request this fix for older k=
ernels.

Last two patches actually fix the timeout issue. Below one fixes QQIC
encoding BUG for IPv4.

95bfd196f0dc ("ipv4: igmp: encode multicast exponential fields")
@@ -780,11 +780,9 @@ static struct sk_buff
*br_ip4_multicast_alloc_query(struct net_bridge *br,
        case 3:
                ihv3 =3D igmpv3_query_hdr(skb);
                ihv3->type =3D IGMP_HOST_MEMBERSHIP_QUERY;
-               ihv3->code =3D (group ? br->multicast_last_member_interval =
:
-                                     br->multicast_query_response_interval=
) /
-                            (HZ / IGMP_TIMER_SCALE);
+               ihv3->code =3D igmpv3_mrc(mrt / (HZ / IGMP_TIMER_SCALE));
                ihv3->group =3D group;
-               ihv3->qqic =3D br->multicast_query_interval / HZ;
+               ihv3->qqic =3D igmpv3_qqic(br->multicast_query_interval
/ HZ);  // This was not encoding earlier
