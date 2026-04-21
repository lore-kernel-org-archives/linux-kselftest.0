Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DA138F636
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760894; cv=pass; b=EO2xOQqNy3eSgfL4tJQtcgtzUm4Yp5iQ9dVlS4naAxvs5VcRV/KijUBwMQT2frY7AkMPPLbJYPSnzyJlyjV6z9Txz1DtScb9/WdFRr6tZWQzxGpyFInOr7JB3Gs92lyq3FgOjTJbbeVavMGtLh1BrwloH9aIJ0WnJSyKvQaboL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760894; c=relaxed/simple;
	bh=5gWD0q/49ZLsDRQhbUstsKZVTNK2YxdD0Bag7lPiTKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFnbubM9jf/D3BgHa5kmI9T35qCPu0Aa29M/SnZOxGJVQDWGEMxd26Z8hoV4r5aewF4wpi/JfuiNRupSBKvpM0SxQp4kX8H2/jnl8QIdvpRSrCqIKypVPfFFbH+NykYqInBVMCAce+3vkd5zAPwbnnMaTW1k6uQ+8iUUjlRpJps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbL8eMy+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAIv2fog; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbL8eMy+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAIv2fog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776760891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
	b=AbL8eMy+FJQQ8Vx0AitvijyiKUsKAJqy4Yc2G69FD3lAU1f4hmXO2LHkK7uiV1BqzoVn+f
	sJ2dR9Yix/+oTLi01P3EiSkQVI5bppQIsEbD0X73yfJ2Rk5HcwiU80LUsDdDgBEXCL02NO
	kFTn1IrXuAdzl5p785kBLOQJmtvTzPA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-TmugNo3HP-S1kBYHmusoEQ-1; Tue, 21 Apr 2026 04:41:30 -0400
X-MC-Unique: TmugNo3HP-S1kBYHmusoEQ-1
X-Mimecast-MFC-AGG-ID: TmugNo3HP-S1kBYHmusoEQ_1776760890
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7a3715e9e69so145849947b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 01:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760890; cv=none;
        d=google.com; s=arc-20240605;
        b=ihNdtqEaRa/5BSkhzj+eYPXd8dDfgF8IAi4D0xptCcMoAPoB4KW6NBgCD1+sz8wTix
         dMPT3LZI1xCqGROxl3IOAPVaSdl/x3lS6KqR8F2HiEsjI4lzl/1Rf/npWySpIQ3axL0X
         XxNHxkmWG/N42f+6CFoVvQv/1AdrUf61K7WA/LdksQQoQNYAK54CGrNijXQmW88oVwbZ
         V5BoQepPOaqXCUmFC/kzRvDcVVRg4bQ7iedusrXui2XV51E42IZJE0BkrfJwgwZSrSc9
         CAWPpJ/gDu1pIjye+ckEJnxOA/wI3csL56gabZ+4U0UG9osvqqiK3b9Ke3e8iaXtR66f
         BNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        fh=ziDwNnUHzWq/5fP/CamBIXI+ZsnPsHlvGwxXetxKskg=;
        b=FEGrgh5IoL2Rbx0zcFpPlU5B1vYDzLM04N1WW24+NnnHDd5Ctit7+eLVSO3aM8C82q
         NEoRe78CjlR5RwSaF38Nsb3eo5p59J6sBTQfFqFrdknluhoN9nqoelyRlcUq0/0WSYB/
         mXmZNnxOdd4jKjlNnUGpCklvilDXO6Ba8f3jSmAvdz04uqNB4iTr9lyNM5wVi2fUVFXr
         g7wDgadXG78xKdeSc6dtD+em1KFKM8cA7zTeWtkrIjG9fHw/I2zQ6ikY6Vom+PPuObRs
         6PtOEpU+QBlff4e0A0cA4B+Z1V/dnVnQTNrFv/wmrqwH5tmF2HI6NFX4lnmz4kzxPvtr
         iOiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776760890; x=1777365690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        b=iAIv2fognnDFBz+mNdugdGnUbXefvJBduQfbB/StpfDAFbrJ+4c29TQ3BW/klObKrl
         rcNZsCtPNxCh70Oo+KR8DqZw+mFIsISGvHGjBwayoB2aVhqUGfXC3MKEoBM/7D/LNCPf
         xZXK6hxAmRRixV0RnxWnggCrkwF77r10hXYYOy/NPVxTYFLIeXjaJKchF4Wwy3ZfavcH
         MZWRVgzDWxJjyFXlsh5S7D7HebXhloBHXGhFOFtWzdctc2RRBYJYpjJ8+0YDArqBzTMH
         bMpgZHxH21MyNRfniphyeV9OfwxNODNPLmv7poigeGb4xGS6uR5j1cplGx8Z54RoofaL
         tmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760890; x=1777365690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        b=flI2k5TjEmz8/uJlQrmGfRTtG9c9v6iMgZGiElD87z0SDi9jSl2rM1UBDYFMgFRHWY
         tHR354W41i6+Fe+wqCdQlMEcLYClA5Xcnjx1jlghcg7cTZYJ6C0Cd9OBL9VRJKXi+KhU
         XoZCiCYG5NcTw7s79P2JHy+dsab0AMWwR+zL9imVTK1DMpSgVnlDxySGYruEKDxpmhd+
         5ImMEEJEH8Rt4s/S7ARqq5G8Ul+dy5fsvYic3SSNd9Kg/v5jVsk/ZCjZhaBTgptLumEu
         GOJw0Ti8HjA+SWXDbFzR1WwDN4qZ4HRxt0EIyW0PUscdBGgMMmanQ959z5VmmoPzCIaI
         /SIw==
X-Forwarded-Encrypted: i=1; AFNElJ9lnjlED5ved4AIL4jCzacJEKwyIVpz0v6bjNBPuDloeWsMw3/a/F7iTUWBR5poY7OLCUR4aIZzDMOsuwfBfTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxJ1bdxwVI8VgTmkpfNE4OGaWPIuslXgLI+J8muqWXp5dzS6Vm
	3GOP4a5CG5GHQrGOwU8a3HDXqaHxl589OwM09dXKZItt02CzgcB9gh3XIvTS6ByWZY8OHfYO8AX
	Tbn7oX9OZM0hQEmFUpyC7CgLpE7vETKeObD0hbujJUKObAYraxRU5OueP3ffqzkLkb+J51MDOc6
	ubiozs9efbWjK8kTOXZydobAhzqOe4SdDKKGcmalTRnF08
X-Gm-Gg: AeBDietsxtLxLxw5wk6FS6UywTJYk5vyD8SN32ExJLIoRjaEWuHWbmBGXHkOCO+iqfy
	3PDHAfuLriKtBowKOL6y8M4aZXBXreAqwedWwS4yuRW+qdkMmpAY4+xysE5gpivan7NKsXnt+eT
	eNkxIcgO4N4z1iQAICPrpUPfAPDW3I5l8OQk0g8WJFjBTIAWlj7eI0zEwdIgaQl71hPMzlRGBEy
	dk8y3eQUUz4clCi
X-Received: by 2002:a05:690c:6e85:b0:7ba:f0ed:c5cd with SMTP id 00721157ae682-7baf0edf46bmr49084327b3.33.1776760889739;
        Tue, 21 Apr 2026 01:41:29 -0700 (PDT)
X-Received: by 2002:a05:690c:6e85:b0:7ba:f0ed:c5cd with SMTP id
 00721157ae682-7baf0edf46bmr49084027b3.33.1776760889332; Tue, 21 Apr 2026
 01:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-2-e8bc6e0f70de@redhat.com> <20260420144453.GK3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144453.GK3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:41:18 +0200
X-Gm-Features: AQROBzCV0B5mGT_w3fyNoIOcvbOSxwzeCNrVj_GyXS8H3Qz0Owy2xkfDx8OhQQ8
Message-ID: <CADSE00LrkRcuWw_uhbRbjvDhoHX4Ogouu038-9kQEQ_3BxPG5g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] bug/kunit: Reduce runtime impact of warning
 backtrace suppression
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
	Alessandro Carminati <acarmina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:45=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:04PM +0200, Albert Esteve wrote:
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > KUnit support is not consistently present across distributions, some
> > include it in their stock kernels, while others do not.
> > While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
> > features, the fact that some distros ship with KUnit enabled means it's
> > important to minimize the runtime impact of this patch.
> >
> > To that end, this patch adds an atomic counter that tracks the number
> > of active suppressions. __kunit_is_suppressed_warning() checks this
> > counter first and returns immediately when no suppressions are active,
> > avoiding RCU-protected list traversal in the common case.
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  lib/kunit/bug.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> > index 356c8a5928828..a7a88f0670d44 100644
> > --- a/lib/kunit/bug.c
> > +++ b/lib/kunit/bug.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <kunit/bug.h>
> >  #include <kunit/resource.h>
> > +#include <linux/atomic.h>
> >  #include <linux/export.h>
> >  #include <linux/rculist.h>
> >  #include <linux/sched.h>
> > @@ -15,11 +16,13 @@
> >  #ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> >
> >  static LIST_HEAD(suppressed_warnings);
> > +static atomic_t suppressed_warnings_cnt =3D ATOMIC_INIT(0);
> >
> >  static void __kunit_suppress_warning_remove(struct __suppressed_warnin=
g *warning)
> >  {
> >       list_del_rcu(&warning->node);
> >       synchronize_rcu(); /* Wait for readers to finish */
> > +     atomic_dec(&suppressed_warnings_cnt);
> >  }
> >
> >  KUNIT_DEFINE_ACTION_WRAPPER(__kunit_suppress_warning_cleanup,
> > @@ -37,6 +40,7 @@ __kunit_start_suppress_warning(struct kunit *test)
> >               return NULL;
> >
> >       warning->task =3D current;
> > +     atomic_inc(&suppressed_warnings_cnt);
> >       list_add_rcu(&warning->node, &suppressed_warnings);
> >
> >       ret =3D kunit_add_action_or_reset(test,
> > @@ -68,6 +72,9 @@ bool __kunit_is_suppressed_warning(void)
> >  {
> >       struct __suppressed_warning *warning;
> >
> > +     if (!atomic_read(&suppressed_warnings_cnt))
> > +             return false;
> > +
> >       rcu_read_lock();
> >       list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> >               if (warning->task =3D=3D current) {
> >
>
> So the thing you're skipping is:
>
>   rcu_read_lock();
>   list_for_each_entry_rcu() {
>   }
>   rcu_read_unlock();
>
> Which is really cheap. Did you actually have performance numbers for
> this?

No, I do not have performance numbers. I kept the counter and the
separate patch for consistency with the previous version of the
series. But you have a good point, the skipped part is really cheap.

>
> A possibly better option is to add a static_branch() that could elide
> any and all memory access.
>

Previous version had static_branch and I removed it because I
understood from the discussion that the gains would not be significant
as performance gains are irrelevant in warn slowpath. But I think it
would make sense for a disabled feature. I will rework this for the
next version, remove the counter and use static_branch as suggested.

