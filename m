Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985E30146C
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958366; cv=pass; b=PinPJojU25jg96UQdJKuK8Ub8amAjI7ZzAt9pYxsZSB++A0s/p4gpW9OiJZq09Z8+ZNxid00mJqe95jh8YhFPVdZAxd099C/vc1GgoOrEHj6TB7ftuwkyMShLccg8UCUTXPTo348gi3JY8eAo8sSdwr7ya9yhVB8SrLa9Uuv3Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958366; c=relaxed/simple;
	bh=Yf9pO4yEuDqcWQqMIIMbqu+zN00W3aXNegGKdZT8+as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWhAKwRRzlD/RqGBojOuLvSXsdaZOBpTqBO1RURRmF9Cctsz64dRbOQcV77BuqzzC29IZK0aZ1D8SD0GkWoGBm889WQ2VVdmFmnrZJfkaNAV3ZXtyYuZ7/cJQ045RnNch5CV5IRzM3fAU9bMRroq7LAQ2qZdPK9PMYhRjt9tki0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivhdTh8I; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivhdTh8I"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso23348925e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 02:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786958363; cv=none;
        d=google.com; s=arc-20260327;
        b=qA7yb16bByUU2HuYTf0qQM3EFZgx2I7HzIlKe8WcKGxOeaPWAZDO+6aE7aZrZGNe0V
         asX/yyEdxvcykCT0YArtJobAmbIRhrojSZIiphUrtcjkBfEYguaUqYv4WyD3xtKkBYKl
         3SP4FQB3y0YfQwlib5MkaFTPuYHBHZgwsUpMGe1Dhznxt9fFwbf3w3CRgQe4y0J8QQtH
         jwDDeasv8PjQz63IJcct0FopfVO+jmdT82OTCiOIQVNIYitwVabJRL6BTOO59TYgYyKe
         VEz9MWP6sCLqecZjrqfGLf4RfMou+0EbiQlOFMpD8PbsLppcbVBYKk8M3+uF/fFgtqxG
         yK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yf9pO4yEuDqcWQqMIIMbqu+zN00W3aXNegGKdZT8+as=;
        fh=OT5F7v/g2/BpeVYW/chY+L+3gsBr1dEpnl2MeCABDcA=;
        b=EcSgkxR5v0gFchFhQnAc4NDDz4aacanp1kHrIrdSD/Xr11dvy3QREZQ3FhS7VSnmUX
         SZ5JlbE/2jYLqcJU99L0dAAxXiX6syf+NygWDUyJxsFq0cZbNFAubs2npXpAFYOIeoKQ
         t6aWrDlTUcJ2UVuVaAVj5cPGCv5KysJvfZL8MjMaOyJSAz6seITFfuVqS+QgL/TewKT6
         3MuEUMAZuhlmHH1dPRW4JmCLz45plVUDtnkoN2/8JCsOCAF7uebP6NPIk6o55wCy5i7g
         OSEQZLkoaT6ejAWkZS33N7YLObjHvIaOwu9Pdws4SHqoy61ag5yf43bZHilyg/RPdzkE
         B1Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786958363; x=1787563163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yf9pO4yEuDqcWQqMIIMbqu+zN00W3aXNegGKdZT8+as=;
        b=ivhdTh8IePQmMw+bEP2XRtmhUFgG0oey7wWgd8Sk/3YhdD4dgVIpSCNCYnObJ1zLlK
         vmKSoCBw7hAHw1HukkXFIi4z0cGs/07d93D6c7Rdn/tMSl7dXyaxfC6WmpGXfpmtnaYj
         ncr3jqsAg3haLwfUI7UjO5EzKNA9RgeQg2nmxvQWeOCJV4DMXTb0roSZp6iXA2wickMA
         1mrNY3nd3mwSKFAORFnIvoh5LmuznOzzGmt7UyxtHTC01qgNISuUluetHzKoUMW+xctU
         B4s5GVbZmX2aIHxruPiKoFC14gx5GshMqVvHhmeJYaLwsfJYnq/KZU0xVr+3I6Hovy2b
         UPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958363; x=1787563163;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yf9pO4yEuDqcWQqMIIMbqu+zN00W3aXNegGKdZT8+as=;
        b=QHjlc+auH0Q6faOBiBbaLuIND7sPcHJugMfnN30WsYGHc0lnx9d31Gh36eRbjyT2NC
         5dAVcDXfeT+VROiiFpMVB0WprkDxU+BlHkosii8R9Poq4v+vUZqpbQT+2SlHcAoPX5mg
         /+9rcASYH6acgLxk+SFuBo2P7n9arC+7QSTEyO10Et91bUYa4MhaeWxvfgvfv6g0d0Rz
         QTAw7JtFumDlmOqqTQ1a0RBcc33JC6T4g2AAmHvd8FoEHycEDyjO8wd3oNKDZomhA50z
         ELXD4RG2poX8Plahk9l3Dc+zENRgSK1MdAiCIQxHOf0hE4mZXfuWT9BAOKSXou2+lggN
         NZ4A==
X-Forwarded-Encrypted: i=1; AHgh+RqTnQlO9ohCGAlqEGlW6delNAUQmOPUPu3zvKB7WBUUJdDi+cMxHHZkZ7Ehd8jJqZzgacTHvvgw9tkVRP8VEKo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6KA3q512aRGV+rCV/rrZggdjUO/VFAJjmo69NOzefH3bsjdv
	nQcYl75riIr0wKl14TuAPPWR2a8wW0lELijO6ScCcjfAlG80WaFBI58hnz5xRfE2N7mlT9DuaPb
	nBgNC5lmPkO9yMTknfsYtej+AENmp0d0=
X-Gm-Gg: AR+sD11IUl/fdeXFio/66v4b0fh5MeNqSGt7ZHkgpX/ns3ZRRJuBMvavagDsHMXoC2R
	aona5Y8xAu8wawr3MadkdcOBstC0TGZEus13FocBArYCsUf5fA6RsNkiLlE5eufyxmPQVqzRrGU
	DiJBMgzYGgtzSOu+hs41xJuNVD1I3rxNe7W97iFxr6r/eeBCUo2pnF30f8es818t8K4yp9eCLli
	AXILp87Q876cNOjnQSGBB/M+F0gs1yAyHfhykfeona4Xp/inNIkj0zVVb8EIR3ycE8kAiQUx78M
	VYaTOBli3Xc3jQECwywQujgFcigTQCaczigVUG5Mdvdx
X-Received: by 2002:a05:600c:8509:b0:496:c9cd:e7ab with SMTP id
 5b1f17b1804b1-499879337acmr413066865e9.5.1786958362837; Mon, 17 Aug 2026
 02:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b1a53c0f-98ab-4f40-b295-a7839a5a3a8a@p183>
In-Reply-To: <b1a53c0f-98ab-4f40-b295-a7839a5a3a8a@p183>
From: Joyeta Modak <joyetamdk@gmail.com>
Date: Mon, 17 Aug 2026 14:48:46 +0530
X-Gm-Features: AcwNN1VR5BV14SRx1z4i67zHMWFZ_8aYWyQKb32rn2axL-Te45VeHCa8MUz6H9M
Message-ID: <CAN3JnUAYOFO3A4rar+w0C9A5wG2VYtEOfq54SysBpSzzkcp3Kg@mail.gmail.com>
Subject: Re: [PATCH] selftests/exec: add missing SPDX-License-Identifier tag
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: kees@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

> The license is OpenBSD, not ISC.
> https://cvsweb.openbsd.org/checkout/src/share/misc/license.template,v

Thank you for the correction and the link.
I compared the license text in recursion-depth.c with
/linux/LICENSES/preferred, the BSD-2-Clause or BSD-3-Clause which use
"Redistribution and use in source and binary" while this file uses
"Permission to use, copy"
I wanted to confirm which SPDX identifier is correct for this OpenBSD
license, before sending a v2 as I do not see separate OpenBSD entry
under LICENSES/ directory.

I also noticed the same text in various other files under
tools/testing/selftests, should I address those in the same patch
series?

Thanks again.
