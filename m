Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4A317150
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929809; cv=none; b=Fn4t2OeEio7i7a9ujwAbI/mYw1EMf7nMeY3lMvsRWGJaBrwMqRqB0hqXoDMk52+yhsebtMYE6BSuFGCFpbWCNfq9zKZbw6hrEefz1Kk2cID3QUXihFi0pSc38i3D5uNJaK0tVUU5Ge2BWQtpRVhnFhWNii/IxS1SI34eTEpDDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929809; c=relaxed/simple;
	bh=oH1bdQsge78AZnJ8U2ypTSnHGZ7af4myhSHPghPP1L0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z2ZqfydpUWXEegCDtdEsyjlnsCHR+PinNy3tdzDvlA9J0TR9+VwPw7DoJHd7DJA1kKOVTpVUhnLC5O82j/YYIam+/unc29VhAQIH/NvjA2qnrf3Mc/vOxMJMkTQLunU5dMPPF9yzxywBvzN8uyp5tkyBHL4UgA58+6bzDkQ9C30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SYogBfC6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SYogBfC6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bcec8613so730445f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773929802; x=1774534602; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oH1bdQsge78AZnJ8U2ypTSnHGZ7af4myhSHPghPP1L0=;
        b=SYogBfC6IP4+wBbk4zmL5TZx8YBIv2InZUqxoMD1eulf9Ht43z+aKEmwy68DeKBdmv
         uaIguj1MMQhCOSUuNREx80QexQ3vQnti0tX8vWPK8GZDQBPEz4mWua/xorj0IKJ07PQt
         E86nHqdbHhzfuAs4yhWfwGUA1SAz1n9dlV3JHeWJENuK5+Jh3FoqiyWpxK3HK2j7FZfj
         vh9Z8jYHLU/J56erWkG5pNzq0P3NlI+cMx88euWiXhawLotVgdv2blLAWUN1rAw1LsXb
         vU4XRe7uafaD4rTqqGKCiHXw+PmhJYvHeWb9hC2etz2k1J/v13u+Tm3of61Wnjx4zW5S
         9R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929802; x=1774534602;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oH1bdQsge78AZnJ8U2ypTSnHGZ7af4myhSHPghPP1L0=;
        b=rEK2DR3dAb907q7wSmBGv7co54k96q60DhqPsOMgVmnL5URIwUrnXnCIS6252dzIMW
         jbMxEJvrUqGbBkPSS54TAmeJ74gN6oxwXflAAgqvbSuCl3IoDpQ3XeUh/8ySsu4A+XDJ
         MhkH2OQq9FjEC1buv8iOxfFEvfeONWvZG+YTTJs1hlFU7cOzvo9kZa5CUVhUOECXdXec
         ezq0696KSMwrCegZoy/3KQnkiEZ9mz3QZ0a02+f0eTFy35Gu/SO0GHrjbNnzLyjAJ9WG
         zxIjlN3DCb0k+z83HTkWzuYnGpcLVnxLmASSIwjMKpG+gwh8lmRbICkpjmG7BJHy5aPO
         xuYA==
X-Forwarded-Encrypted: i=1; AJvYcCUkztLTREoMLWwdSt5qEcoct6iGzPb0eY6i4dL3hNiGgaYdzTq5FAjXj+XELkPZh6/0R78/IwHNr6YlbcA+uPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpEG5ntKM1FS4crXkk1NdBTdMM8GqZnFKEwfJMyCOyf1f4ODQL
	nJkBI//tCIZTuGFKsMzzExhLtCcOmDFG+lJl//dCB/HjAkr8YccWtf0o1Yyb4atJq/c=
X-Gm-Gg: ATEYQzxBNv/xdGMKgBJ7ZcdS6qP5l2k4pRjREv7aa5QD8/NkoH6toIbjk3hbdxA279R
	pkfdmMsB/1nuLf+iHiCbIP94Lv3LbGZda/RXBfltinWps9WdwZD0OQkbeS6rfL21aTkiNFT5Dk+
	RBloTsu1W+1mbZohhKya7BpOGfK9tppntrx/tZxy8P3w9yICg75qYPxJW3WOLI1dOQ6MF+JAqcq
	aRy4wYk8la5sJEHjSGLZOhxEFJ8pWPTodv4tNg3QAEF8pvpZfA9qLljso43FNH7VyWgPJtpWZBY
	32e2gllcO0snffi2eVmrcjk3AbufKbfCN0nMxO8ZHoXvGcfrApVBzHcfMRcuMvDIJbbY50H7Y3C
	Ea29ZgSCd93ag+xxk5EYXZurcof0AUPDIbl2cMqrJnWVZP4UsRhm9neSppxkrdiVOIqBibyd/bw
	9Gy8OcMTagteDPzO9H6mRv010XN8XQVJCXnpdVU7bDvJ+7sLczxE48ITEk95FfL93o9Ej5NHMZ
X-Received: by 2002:a05:6000:2483:b0:43b:4469:d31b with SMTP id ffacd0b85a97d-43b527aa3afmr13023574f8f.15.1773929802286;
        Thu, 19 Mar 2026 07:16:42 -0700 (PDT)
Received: from ?IPv6:2804:5078:834:1300:58f2:fc97:371f:3? ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51851e43sm16852370f8f.10.2026.03.19.07.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:16:41 -0700 (PDT)
Message-ID: <a57eb2eb73eb8bd817196b8505ab59d5c3bc187b.camel@suse.com>
Subject: Re: [PATCH 2/8] selftests: livepatch: test-kprobe: Replace
 true/false mod param by 1/0
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Shuah Khan <shuah@kernel.org>, 	live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 19 Mar 2026 11:16:36 -0300
In-Reply-To: <alpine.LSU.2.21.2603191401380.22987@pobox.suse.cz>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
	 <20260313-lp-tests-old-fixes-v1-2-71ac6dfb3253@suse.com>
	 <alpine.LSU.2.21.2603191401380.22987@pobox.suse.cz>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-03-19 at 14:03 +0100, Miroslav Benes wrote:
> A nit but I think that "test-kprobe: " is unnecessary noise in the
> subject=20
> and can be dropped. It applies to all patches in the series.

Ok, I'll drop it in the v2.

>=20
> On Fri, 13 Mar 2026, Marcos Paulo de Souza wrote:
>=20
> > Older kernels don't support true/false for boolean module
> > parameters
> > because they lack commit 0d6ea3ac94ca
> > ("lib/kstrtox.c: add "false"/"true" support to kstrtobool()").
> > Replace
> > true/false by 1/0 so the test module can be loaded on older
> > kernels.
> >=20
> > No functional changes.
>=20
> We also define a bool module parameter in=20
> test_modules/test_klp_callbacks_busy.c. Does it have a similar
> problem?

No, because n/N was accepted as false already on 4.12 (SLE12-SP5). I'm
not sure about older versions tough.

>=20
> Miroslav
