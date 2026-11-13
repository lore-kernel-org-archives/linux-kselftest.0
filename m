Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595189;
	b=nigUmbxHxfa1C4m0FXHpl6yR5LUaiwOyk12XnPgTkqATT1UJ+E6dNxuUrNyXX1y4ZK4A
	 hJAEkB7qkeOw4oG0KDp57w5SAVeD9zkQQTsiiNyPh75/kPYnubE4uzsfvQ6c7+ylm2sak
	 vomW0IydiLsn9FYJTUuCqEyTpILgBZ1DFABG99ZDs05J8O6zAixpiFTPzOBp1O2ehvGLy
	 TLlCZg/xVpR/heJ8eyh5thTCOwAE7bI2sOg8DTYOb6YchbH2rOCMfN4Y0LA22ZrG5jAYu
	 bcanYXUdzRNXTp7ln2dI/oqvIQXjipmd3dNvJB+MMPHQ5ZIVCIz070Yx/OXOhL1eg9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=3NBWFEB6FU4/z3ljBBQ8NoiqjrMo0KVomaOmiAC4b50=;
	b=KCh8HdTIv8rfwZk8B0V/a41LLg6Boa/ITp2Rfxv1+ZVCJUxe4FQDce+qY4bykkWcO1mb
	 QSc8Y/hgZtTe5+jgSwp2nu3hfkHY0tn7XU9SAfSAim1Ol9H9eiIDGuzjnk28EnbxmUl9w
	 x0IWmvlkDQxcf/WFr9ZeRNd1HEn5WM3ty+z26RhjaJDkU2QntAaoqCSCeAW7M5ISvcr5W
	 c7+J7XuTcRaR4jUehoKTJiWX0U8Ogwpyo2cvW8lqq7HZV4FkwIeelwWV+e7ogkscfhajc
	 TY0Ye+iC7c3Bf8U04xozF9U0+GP7gJawiMSybkWTd1L/5Ft1PYE0ebceCsSDzcWQRlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qV+oc8d0;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9D60718A5
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 18:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA9D60718A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qV+oc8d0
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491aaed7565so590359f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595187; x=1795199987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NBWFEB6FU4/z3ljBBQ8NoiqjrMo0KVomaOmiAC4b50=;
        b=qV+oc8d0hSgnBdxOfdlcbt3gZsZIo6yoeaCK65K5fkRU+FjSHaBWnHZSFnQ5tVF8Vg
         jvMUiJnk/8K/QN/vQPKBYvKhu6OQs7B/6R/V7mKggi1e3HVzBX48JKU22vy6fWVCyjo7
         FNYnSx8KjCnqHu0aEsu3D+RUa5t/P3Vhbbz21efPcust5Tr8FbSo514Ct2BjzZJlbLoF
         Vg0c0sVAaqwoEVYf6es5Y9I1CzVGo/68ZPXtuNvkfpc8dkxLQbV3tPXdcU27Ti+dg+jT
         Q8/gnsRcA4KjzxTU8cAOtjwMEr8OWiR3Kwcx4KyG9Y+RpMFOoRJt8MI22yzCx+xpM2rQ
         URJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595187; x=1795199987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3NBWFEB6FU4/z3ljBBQ8NoiqjrMo0KVomaOmiAC4b50=;
        b=Q/1uEnOQSOGJAUZax1CVHe62ymKIbksNF2NTswc90wQr4XjQWvUGGhEzbbFKzJ/gUx
         jFayvHErGHkEOH08mxTTRzySgdCVDDV7GjkpOrYftzFqxpBsSmV8CidhgEYjqVoUvknZ
         58OdftB+dj8jlC6iodJyCfAYGJRscWRSk9Sd+8KIJQAbOoxxHBNPoIbUxdciH8Ra1r15
         o/RIivkzKmT+3zWeQEsbgu51+EXuig231KpsO1bo3WUvfetiZE8hAFrEA+3aGBFEz7Su
         nITxVvFW1dm3WRRacgCpiCDDxA1maAsZPyHcjqE4GjZwEc8vMz7gQCsosZPGGjbvft4U
         dhkQ==
X-Forwarded-Encrypted: i=1; AL+hErE2wkozk+RnLwossVvHdiR9ooVJYbHN7/7fqFVjAyDR40s5Zmsx1G/USdBdjFuB1Hmaiev171wvtGZ13A/MBQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bQT1ZNTXdYx9rjTm7n/tFNEHZy3njhJE2ew3z/RshUW3LpXed
	yLvzLyBszZAitVoxMXKK3xMlJJVgcU5aXkHQbQvCFdnlsTDb3YQHAMyB
X-Gm-Gg: AYBFou0WZ+JQM+xbUlLRDdutypwqWt27BPQQAnVadcGPhPouO6voTu8Vo1ssTSqLzN1
	X2SJqGmTQ4x/X4NYEtY11Y4gW3xlK5hDi+5x4nVUpWXuLtZ4qsXBA+ODAYC+FPedcWh6BAbVfsG
	MeAfVHzKDStPSnViAoRS545kUyQNQgYFPke0mqqPJ+796gQdMMgutoE4GmGWx+Rw/B2317GNjna
	Sk6AbO+uG4RMVLqpxVCh6weT1Q3iYK0PnL6m8CJ2Fg3br04yOqso1lstkfQTiM5zViFHeVM8U/7
	n+oeXih1RmStR3uRch2dRsEUm3RTyiXgJl9itjICwkl26ZydgZcFIQIdiPUVlSXPqfx9rXkRlDi
	VPSwch9bhzh+QCpftNiGPgtn0J/r6GZdcf0+KHGqcPQKg6zpKlUT8jFyTXUyxKZVH4Q048ce47Y
	EQP96esHdMm7JfwWYK5ISntOtxLITmo1XN6BLJbJb8MO2cQ5yERvfIgNTqZZzZo0u6EdBz626xq
	to8SxB2PFgFJzY3DfYPMgPDyqbe3B5j67nr5oBR28j4+TTdCPXyTkVnrxgJObhJMM9JtAWq9Mt0
	ck9maejIsLD8qZGH8p4tmmW9F62j4frkGmYvgeIVEyM5LDHo0GpfLg==
X-Received: by 2002:a5d:5f91:0:b0:493:d5f0:4e4c with SMTP id ffacd0b85a97d-49c723fc45emr7653677f8f.23.1794595186940;
        Fri, 13 Nov 2026 10:39:46 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6346363f8f.21.2026.11.13.10.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:46 -0800 (PST)
Date: Fri, 13 Nov 2026 19:39:41 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 4/4] landlock: Clarify implicit handling of
 LANDLOCK_ACCESS_FS_REFER
Message-ID: <20261113.7a962670e000@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261108-b4-landlock-refer-nonfs-layer-v2-4-2b405fc1b3aa@gmail.com>
 <20261113.Ahzeu2seey4e@digikod.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113.Ahzeu2seey4e@digikod.net>

On Fri, Nov 13, 2026 at 12:28:56AM +0100, Mickaël Salaün wrote:
> On Sun, Nov 08, 2026 at 09:23:51PM +0100, Günther Noack wrote:
> > The LANDLOCK_ACCESS_FS_REFER right is handled implicitly in a ruleset,
> > but only if any other filesystem access right is declared as handled
> > in the given ruleset.
> > 
> > The old documentation was still a remnant from the times when
> > filesystem access rights were the only access rights that existed in
> > Landlock, but it became misleading when we introduced additional types
> > of access rights.
> > 
> > Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> >  include/uapi/linux/landlock.h | 17 +++++++++--------
> >  security/landlock/access.h    |  9 +++++----
> >  2 files changed, 14 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> > index 24510e5d8479..7e38b9d1bf12 100644
> > --- a/include/uapi/linux/landlock.h
> > +++ b/include/uapi/linux/landlock.h
> > @@ -22,10 +22,10 @@
> >   * enacted.  Vice versa, access rights that are not specifically listed here are
> >   * not going to be denied by this ruleset when it is enacted.
> >   *
> > - * For historical reasons, the %LANDLOCK_ACCESS_FS_REFER right is always denied
> > - * by default, even when its bit is not set in @handled_access_fs.  In order to
> > - * add new rules with this access right, the bit must still be set explicitly
> > - * (cf. `Filesystem flags`_).
> > + * For historical reasons, as soon as any filesystem access right is handled in
> > + * @handled_access_fs, the %LANDLOCK_ACCESS_FS_REFER right is always denied as
> > + * well.  In order to add new rules with this access right, the bit must still
> > + * be set explicitly (cf. `Filesystem flags`_).
> >   *
> >   * The explicit listing of *handled access rights* is required for backwards
> >   * compatibility reasons.  In most use cases, processes that use Landlock will
> > @@ -462,10 +462,11 @@ struct landlock_capability_attr {
> >   *   This access right is available since the second version of the Landlock
> >   *   ABI.
> >   *
> > - *   This is the only access right which is denied by default by any ruleset,
> > - *   even if the right is not specified as handled at ruleset creation time.
> > - *   The only way to make a ruleset grant this right is to explicitly allow it
> > - *   for a specific directory by adding a matching rule to the ruleset.
> > + *   This is the only access right which is denied by default by any ruleset
> > + *   that handles filesystem access rights, even if the right is not specified
> > + *   as handled at ruleset creation time.  The only way to make a ruleset grant
> > + *   this right is to explicitly allow it for a specific directory by adding a
> > + *   matching rule to the ruleset.
> >   *
> >   *   In particular, when using the first Landlock ABI version, Landlock will
> >   *   always deny attempts to reparent files between different directories.
> > diff --git a/security/landlock/access.h b/security/landlock/access.h
> > index f9eaa2f53686..c4a81f7dadeb 100644
> > --- a/security/landlock/access.h
> > +++ b/security/landlock/access.h
> > @@ -18,10 +18,11 @@
> >  #include "limits.h"
> >  
> >  /*
> > - * All access rights that are denied by default whether they are handled or not
> > - * by a ruleset/layer.  This must be ORed with the .handled field of all
> > - * domain->layers[] entries when we need to get the absolute handled access
> > - * masks, see landlock_upgrade_handled_layer_config().
> > + * All filesystem access rights that are denied by default as soon as any other
> > + * filesystem access right is handled, even if the access right is not
> > + * explicitly declared to be handled itself.  This must be ORed with the
> > + * .handled field of all domain->layers[] entries when we need to get the
> > + * absolute handled access masks, see landlock_upgrade_handled_layer_config().
> >   */
> >  /* clang-format off */
> >  #define _LANDLOCK_ACCESS_FS_INITIALLY_DENIED ( \
> 
> This is good, but it should also be extended to
> landlock_upgrade_handled_layer_config()'s and
> reparent-exdev_layers_rename[12]'s comments.

Wow, good catch!  Updated.

Used the same wording there as well, "...as soon as any other
filesystem access right is handled".  It's a bit verbose, but it's
unambiguous and I'm hoping that we won't need another edit to that
wording.

–Günther
