Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792979226;
	b=5Ld2QW/tqn30n94VQ9plUZIOCYaE1Y1B9dRyXr/ymdp77UTx50gVwS/VMXJ/ZWSaKWCX
	 jW2n/IWlwI+BMQyW6TktvtVnsYMNfTg1LWimlkfGOBZtF7z3ej0VUZRdFjPC88fqyRjET
	 eAMLfu9EGVq+ESHwS+HknPaoNnvOhRXytMS+Sj1TzIZ0kiSQQpFt7EaRQaIFOfEPjQSHb
	 QpIV7TJWekULDQgfvTw3CryhXWSwk+OQFZmRWUCKkeFQurBjTXA4VpbGd5zgPO4O+19Rv
	 SRXRFEoW+zMeOZm3rF5sTEPUhJp3tAcOLz1h409cP17cvnZEVpWWHiELhxbWEmAYfHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
	b=ldUVLGDIIX7+Z0Nte4lCQqbUyTIBlRTPTWfUerfLiTjNNszvTCe0UxrAp473xYas4ySg
	 0fCl1WJfsN3wAlA1qdQw+tEn4lOpMrA8gb49V0RDt8s/sKsHeROAVL7FhxzIm20YjmbEc
	 7GNeg57Dj9wuTHTTqcfpnMiQqK4zkxSl6mHqFLxOyTqOLQIEJAq9DG8tPW9orj/6MlxYc
	 bViAL2sIQ/hcw6EzluJ44SM1WbQhfugbBvoM/k1gOKrv7q7SwynI24OR3NdCnp06x1Oa+
	 WTwihdtSYhPBQdHla9dzDLXTKSFDmGiOpJJ0cbyWx+3caag5SxNQYRyL7m0JO+7vZcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A02606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5366ae57896so27059541cf.3
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 18:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792979225; cv=none;
        d=google.com; s=arc-20260327;
        b=jgO8ElWrwkS0VxAz8MTgvODt4Kv3BD/i5v57AawDCoZ/Q1hYLVa4Urfe5P2tAmyI1D
         AhOyu7YFr6an/rqU/tyPnF63N5WfmZxMuLY6dBeOZsK/hGB9JcGgUYvWo+Tu6lbSmSjh
         t20/FlmBh9oGqF2t7rBmCzt/vJmn1/tWdLjkWQAk8NAExm5GySCJhpswW7tnaPVrdG4/
         5Zt7N+8sTvnbP1UOGzbGIlSjaJQZ5o9yaAjcN+5XdyzzU9URPK+DzbWp5my3cTzHSQ4S
         GR52BDz1dzfjwdtfMDayQ93xVWZvV4GCpbHTc1mTsOYYM5K/V+BMA/JQyVnMqquOqeLU
         vR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        fh=LQyy5O7FZzSndV+26X/ElI7BkMuzFgtlnTQbf8G4Nv0=;
        b=ND+B6jL3xQxTSWcVwAnDKbWBNJiFQMs97NrrkBF4YpofKDtqiTxj8mWg5pv/BuTPjt
         fi5MHPQVjZiLgOuvRsFilPtoO/1twQF3azh1iiQQJrwiWq3BNqXCvj+qkk74oUtNOqg/
         xopoX35Mpn/Bjseo6y5beqd5IVew50lubE5KQRQm+Fbx8hBwuZt9Kg71FnORePfF/oh+
         2R+xZOk4NK0brjvk8geo+KT602G6m7itfPWKCWNH6QyFkd9yBgRHfHTCtFmYRX24BxeG
         vtFQsm68xY1sLiPCiD3R+lPVzM1VAJY1z4dWpvKOHejMRZQRVVbOVW4k52caCQDREd4z
         qvfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979225; x=1793584025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=k1mpcIkwc1AXi9hb/mRiT22ro6h4FquWA+zMu8daRo1fzf4vKr5xnlakJSPrkylW+W
         BPZQZxoIuCc5J1ChOieBApdEw58hxaJegMTS+iftUo0MadwCUXP2cJ0B0whCpwZ+01Z1
         6IFaEE0VrSDv+WIDEJhZYV3SGEAowbSvdCmVw2p7/G1g4A78LmsmBHbkZqb0mvuv4dFC
         snhoe1grlRyEbSyotA1Q1Juwg3f2IhHshZugchVTm4VdHPkeEDh8eoNcsGy+04ZLaZg4
         bAOcnKmJU4DoOw6K23d2WUiJhP80dgi1VFqxTXSid1Z8+QvzOJfNJ36nkwBbaaX5ci4b
         ea6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979225; x=1793584025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=EsuOHC1YObquDaS4USo+Qdo+Il+JQQUOGkY0QX8x+AAp5cvttHBo7DReVHMnedH4Ce
         QpvUGUbqmHD3mkHE4OU4sLHvtNzXtcaMCFKy3ApDaOX6RA+dGzecFQcrD4ke9FWBlSuN
         FrsqRgV84da4PqUL8VOhrXhGk+Nn9cKkxht7tOYLxIXojXGG623E1Jglp3PaBiu0gnJO
         /eantv+E7+U4mEAbgMFy2Y+WgTOGHtrW4HdLZbDNq+gMpkUa2e1zUUDBipoIzijEjtFG
         Ex883Fx+I4QNBgWl2zqBVuGg15PcaOD7iduRBS5Z8ClR0FEjhVQcrtc+isHP7TtNLVoP
         Aiuw==
X-Forwarded-Encrypted: i=1; AKwUvBzzOgRenjz4pRYZQ8kXzCfIpNv1QhFoRRvhWYT/4lZorLm/1gJY365Pymhbn2eDVtZFXaSG0ZcC3bcI6FVmu7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvmcrEueZGu6VxUHRzBT9EKf2aY1oORXxIZbWOaOrVujCk6gHW
	3UTPOkXFeiO5YwjOiIMrqem0F8QgAKCwRNTiRfjAM6sX/BW3CZd4MgZeWyvrOQW5qt3TVXQ7oSF
	u87ZGqVNhyT6VuhgA7FM8UE1YTMdCozk=
X-Gm-Gg: AYBFou1gvPog2/sH6BigtzWs3kmWKYSP0eZkQ9vXbwa1K7DOQCqDmwMr9/J9jI1iWxH
	78LJ6DvxfMNea6g7JIg+6YglK8//8aBdgAeHH0GdNBKs50j8nVOHxm6UN2DZqrt1o7gBIf/Z+gz
	HSSHktQsqj8ktnSpOumQmG53Dh6LKhjTK+QT9bbi2pWPsupfaGlmYwd35yQLxRZydnhuenyodiq
	upV+6leySNQicUv0cDoSbNn7BQHXc/NalvNhGVi8StUd9H+RC29DzXd1Gb7Yztaz/1rTX6vNtct
	2hWh0la/cSg43DewGwJAosZ5le+EV1yEPjCEMhnNeDjPBY1XZElTpOD1bCOk7JIiTbNuI+dUdaX
	hubmkoAGw+8Q7vH2hpzB+6oIAMZTEXbTxzbWfkcbUhcYNAIIAOGe2D/M4S7dj3r40bvdV+gMovh
	x1qFmRHzVKrvmffv30vcKjhvfGx+fBCB3OOvQa9M2NqEECuNQafaI=
X-Received: by 2002:a05:622a:410e:b0:536:8ab3:cb01 with SMTP id
 d75a77b69052e-5383b5ebdc7mr72082141cf.26.1792979225119; Sun, 25 Oct 2026
 18:47:05 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 22:46:53 -0300
X-Gm-Features: AclHuK9JgkkXlRw89V59iiWDYLD2QDEw_R-Zfh6fzK_yYgw4tVW-PfwZ2k_irrQ
Message-ID: <CAMAsx6dhGibUuwBzj6k+A3C4ZGAxPSdLyDbjNfawpKR0Ufj7nQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
To: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026, Eugenio Zuccarelli wrote:
> An LLM-based coding assistant helped draft these entries; I checked them
> against kunit.py and kunit_parser.py.

Hi Eugenio,

Resending to the list, as my previous reply went only to you.

Thanks for the v2. Moving the tool disclosure to the changelog looks
good to me and matches Documentation/process/generated-content.rst.
The two entries match kunit.py and kunit_parser.py: --summary only
prints the summary line, --failed prints only the failed or crashed
tests plus the summary, and both are ignored with --raw_output.

About the indentation: sorry for the noise in my review of v1. I
checked the raw v2 (the mbox from patchwork) instead of the copy in my
mail client, and the continuation lines of the new items do have two
spaces, aligned with the --json and --junit items. The one-space
indentation I saw was introduced on my side, not by your patch. Applied
to docs-next, "make SPHINXDIRS=dev-tools htmldocs" builds
run_wrapper.rst with no warnings, so please disregard my first point.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
