Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED9382F2A
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760181; cv=pass; b=D362dE5sFg9mbuAQEESt//0YF/g/L3UYB5EUlyyMtRtekqy8qdrwFkQo8WJIlStmIHi1r1lZopLehZ3TvcBeQwo/8EhXJyLLPBRm52ZbzWF6MXMsKqHIi3HPkvBS23VZqBQ19fneMNA8yo2T7NvM8nLcK3Mxh69y9BeQfz5JpmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760181; c=relaxed/simple;
	bh=VmCa0w61OkMEnKKTodFxVw5pyBCXmkzpXCWn+msH7do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+g6I2gFfvA+tBywD0cgCQNdfMbsH8e99fp3smXVSxjduiVvP6+bECJt//c8yv5DToIepJJwkmFZOBcv4I+m8d2+GIrRhRUgnwAV643kBo/wGl57wXuxNgEk4FyLIQDwo/PMnN069COlGkGuo2GCPvpKhrOsxSbFgLnK08nX32w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MM6C98PR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmPllE2y; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MM6C98PR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmPllE2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776760179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
	b=MM6C98PRXQXRyyEMOLx48abUBpN7LMmswzRMJVCmk/Km5bsdYdRoMlWYcAcIT1kaN4QNSY
	hojHpyeRbTCiYNdLj3aqUVmZp6Y9X8/Lkz1mEdG5jUdmaxO0KGfsqc0cDNgdCb/7n7Mvad
	1EmgDVqg3Zocjq6uoroD2PExU4Pr8C4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-LJcJ8xooO-WEyJqftwJnxw-1; Tue, 21 Apr 2026 04:29:37 -0400
X-MC-Unique: LJcJ8xooO-WEyJqftwJnxw-1
X-Mimecast-MFC-AGG-ID: LJcJ8xooO-WEyJqftwJnxw_1776760177
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7a45cf7ff24so64535047b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 01:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760177; cv=none;
        d=google.com; s=arc-20240605;
        b=X13b8OeyCQ+2OZ+maFqofUg+wJO+S8TRWoLAUkAAMmWDoY/Lp0Psl5b5sFolF3xbYa
         Lgmr1rxQpNds8d6nmU+HnMRLeQYhA6brhAy2BgPyB5Tjg7ef4kHXwHbkRwASgeuGhaMo
         0PIqOB1Us7dWJjPsH7m7apWlrzoHdxuZMed8LZxX5e5mJ2Lgrh1ZZIWxYFam9cRjb7Pv
         qO5YUvMZo8+2uuCSqHc6LXvOw87fhOz8nySI8dav4/n/Hp99/gaN4fJX4fZb4nTVR4u2
         nxTHnJajc93Xi43QKVyJ4UBqWNQt6CBf+dBOxp0L9lMXYAJrCUKlnai0PuSt1nSqwaVG
         6SvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        fh=TYUKHJQQE99IgKLevZ9b6FQmtAKq0ziPcr6H4RZIZ4I=;
        b=afr85CRH6wsqfV+Y5Ujb1GtoELeLpf2f2egk4X6DDc1Ol8EYHzdcXUsGFGK1vqlUjw
         NVy41unuzhxWWwjDkRUF+TP6hNwht+3nWxT+/XnCFE9D1wjaSK1YU6FT1yDleWLz/KSo
         g+20mn76wY1yFgfewo/iwP+s7RvgCrxlagQmIAwN0jt8NHFnHOlaUv4qRC9jJpxa5Txv
         7DiPCvYlaBUJ+VVkIzzQEaDEH9AKHovtaqKQ0608RV89lx66iSfDB1WwWmgmQoCviSYW
         S8yNYa+d+bJ3EnIHPEHvuNqWmNK1HEe65lbXaeUllyQ6lRgZ3w+pZav6cgC3BIubalzz
         ReQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776760177; x=1777364977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        b=ZmPllE2yqOnE4NFZUcU5mCDLTCf9hJPPseg26gDq4NdTSCqBYnqxuoYrTotCpQc2fD
         Kkidt50vpDEGCDwWwr3wDU5q1aavZPXhlBul/EmqkQmJhnvbLBQsMiLrCyDtr4VR7IRn
         24LoiPP2tm5lfkD2r9jruQelTLhvcIKH6pxhtqIgi3vQbjIc7JYlroCPUyIEK69NU4Oj
         Oq3RxiKLTEFOH9pbNudLSYel1UdWoOORRPBdG1RYESQdoVAa7d6Q8+jpbqxyBQx2nEL4
         iHtu8+DQGaff3KQBNbrXnP+3m/Hf4YFIE+N7XTCkR3Kt96H2swj1z/9EMhHTKmYbNBu3
         ZkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760177; x=1777364977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        b=gnulLQkWJK2Ov1pWe7oWwpv7Xnyrg7eBnjOxDXudTE+XsPXM+bAn96to1rUaeHArvg
         VxH24SIUG4ipqQlt8EoByOJ6zhrqcYwfqr2nm3B5CBAvs4hjueZVilnmr3IeEU+lI+Cm
         V0nOQPSeO7MaCAc6hINx5tttxj4phaIcEX1/YfRP0VLqQGSM3Y5LrXMohM4zggOeeCtk
         bYszl0Le9ZU567IJbnU7y/NZGwe5OX/jBDmddKstCHlxggVugg1pNs1aDSATXSd0lc/j
         E4dW5r8vxlN2LYExqrl9GS22jGsUwv2vG6HqSS6yoPXDmsV3SzolVFYltJizrpvEyZOk
         mZ5w==
X-Forwarded-Encrypted: i=1; AFNElJ+awBMb0WYD1JppvJLbB5oYNWX3lPEPoPGGFFVMmMoSp4Yg4QYFloYP2IzPCF9CaBh1TB4mkkjdn9uZwwpMoY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsKH9+QlXlbqPL2RwvfRo4k7uBk7Ld69bbhZOyHNFoI8BekS/
	3k8e8b8L6nJXPPclp4FkC/t2wgGOIIKSuvfgNBdkyq8Nc0OFluhRP8aLbSvUXf76hrb5azIIXYp
	inS0YFKkBsTAuKqlUS9uctyebNYHcMhutunCgFhlk/by0Ze8H5MggyEDB+GYJqBqLLF8TMJmwcS
	uIbWMSMK1YrqbMiJgEvlAyrd+HuhXNEQesllsnhHTcBPkk
X-Gm-Gg: AeBDietpkvkVAwhxERN93MpeP98+k2PNdL8wVRUXWEuTvxZhE480MGfCIaWrG+jn9Fw
	xDr+pmK4GzE7heG46oBexWOdxez2T0OfnRsp0G6ZLPQABHFh7l/ErnR5johbwRhgRs69eSsG3n9
	dCkLWIpnY7cxFyTJHFQywhyf93+tnlmGKD1i0LJkDRwnyJmHB2ix0C+ep3BkzPoi4WLHat0k0bm
	ARFMXlRK4Lxm+ec
X-Received: by 2002:a05:690c:1a:b0:7b1:d1af:4b95 with SMTP id 00721157ae682-7b9ed03ea4amr180130407b3.45.1776760177002;
        Tue, 21 Apr 2026 01:29:37 -0700 (PDT)
X-Received: by 2002:a05:690c:1a:b0:7b1:d1af:4b95 with SMTP id
 00721157ae682-7b9ed03ea4amr180130217b3.45.1776760176561; Tue, 21 Apr 2026
 01:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-1-e8bc6e0f70de@redhat.com> <20260420144512.GL3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144512.GL3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:29:25 +0200
X-Gm-Features: AQROBzAEAbEFlPw_UOBBc9Hp9GuZ76mdLqLO_-KNOSIDgp6-Bgs3Cp1G00-BX1o
Message-ID: <CADSE00KyJhzf_p1Z9qZ-PRi5_9pEhSxHnP5wy+kdxexB2a2scw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] bug/kunit: Core support for suppressing warning backtraces
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Alessandro Carminati <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:45=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:03PM +0200, Albert Esteve wrote:
> > +bool __kunit_is_suppressed_warning(void)
> > +{
> > +     struct __suppressed_warning *warning;
> > +
> > +     rcu_read_lock();
>
>         guard(rcu)();

Nice. I saw plenty of examples using explicit calls, but I had missed
the guard. Thanks for pointing it out.

>
> > +     list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> > +             if (warning->task =3D=3D current) {
> > +                     warning->counter++;
> > +                     rcu_read_unlock();
> > +                     return true;
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     return false;
> > +}
> > +
> > +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> >
> > --
> > 2.52.0
> >
>

