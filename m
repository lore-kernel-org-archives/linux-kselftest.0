Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4F2D2385
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256660; cv=none; b=D2RzdUVmrqkKIM5/P+VWh3IAQlqDSL5ykS7+ivEFgGKskb9Syr0nZx/P37lhBUgaOHxIr7zY6D6+7ffDQsqe2Ws4cRqpNnRrDtxoHm3p5IB/WJ6lCvEq2FdSO7qGzd2rEAn9/KTQgD5lQReJehcJ1q7QowBPWBGzBbn0aaIjRlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256660; c=relaxed/simple;
	bh=q4znQqg8V/w+XTKKS6TQ22baPgvBcP185doNB6m/8Eo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZWAapuKskxjHftiot/A1jnjeqxboP1i0uGoh1BY4jE3AwIpRW4n4FaIic+aQuF2mCv9NGQLemjK7ib6ZdEMBa2V8lb3WrEXLgIHjoN2tqRZgIx97F+8v+7PfSDJbzu/EaiRnjbiEQ4Qnr9kmLH52/9nkQNCY2QmCBljy4yCsBb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NihDecWh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NihDecWh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so4713192f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 05:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776256657; x=1776861457; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q4znQqg8V/w+XTKKS6TQ22baPgvBcP185doNB6m/8Eo=;
        b=NihDecWh8FInuI7hc8thR0MnAL7IO4TfE264DqxkIk2aVjd9p6syUlUo+eXPbtCirt
         Y9L8qbqYdiuCBEm1ogRjSLxjA8LGMdfDEuH81yuY+RF8NrIWblgXVNvrnzLsVB4mgCLl
         JM1znEpBMRxcyLSbzRxXAz4nafxqbWXIZcCSn1DjvmLKPMmDU+9yzEI7Z2Xv9eLrmwyO
         krl3I4FqOjL8MerTRG4fAlgOPYCWaZ0M58COpqaZy3OEfiDv8Jeytdto4cn+6seJu4eP
         igBFgSYv+B5G9zPQkoGo3CwfrG/k8zWHR5l89if+ljkdmhhYZT3xhMEKxyfJzK55T9eM
         kedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256657; x=1776861457;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4znQqg8V/w+XTKKS6TQ22baPgvBcP185doNB6m/8Eo=;
        b=ilpL+LYUCX+leVlUC0lkbbQpkNd41RC7DVj/Oc3e4+k96gGJhOaviO2rD88KKRLP22
         BT3uYZCkUjvGAxNjHCqL44zZJZujLJwxbk3cL99PCjHFqqJ5dwCcu6lUJeuB04laT9qM
         Ghd4+HcBsMqXVwPee9EaRDhlkHoLPwBbXLlulwAOOsgZtvfeVeKM6a7H5qArr5sMzatL
         mqr/UmgoWKcU3i6Gs2cd9N5yjHQRINXMadnG7wSY9PtknhbJB8O+/x2++KBFS9acXkAa
         JFkhT71nIQm8r+6eXpq5PvLAxA+RNyzewvK7mRIo/h73r6cegTXeXGEk7w48XTub06nT
         r3Kg==
X-Forwarded-Encrypted: i=1; AFNElJ86Uewac90CFDD5abPr+S3mtGvslmSX+lNWUD7LKVLZwASS5ncDDo1ntUjbTp1oxfg8wALVaeFKQ7/GZzEoIjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9yLrFV3NCCsb8x+/CsXb7OKbrFr1mq7Seawk9PHCgxVT0UUQE
	yfravoNO4P7KSy64FHnCZ6xLyM9dmzYaqitNlNO4LuimjH8mB2rR/zYQ2smowu4IZ/c=
X-Gm-Gg: AeBDieuVcypH8BWCbFPzjfySmsFm6a3R5WT+1h0ANSGD4+y3+F+sFL4dcXsQMcZKLMP
	A7+b4EvLBlwxiZ3zgJ+YjNVyYG7UpZc/ZZkdNLKeVtSS8sbhTy2RSwx8Q46bOrhYKwuyMn53xpp
	GPE+OF4cLYhVIcyEL/q96/6eaUB+WyS3MThP2ClN5zYRcydRoo4+2EIGeCI71e+sCYJ0AJ3z/nB
	ScXhQIys10WrA70z1CUVqLOpCpzOnz8i9I1H/rQ1AVLu240dYylMZ/vF7OOxhgfS+PSqnR8xXjU
	qaD/QNk1t4Xh3nwEnutF1AXCXj7+xlDuF41zl3TwfmFVGdmASpBLvsC/0sErp4J30YMDGIIFwtE
	QqNtiFaqqi0QCupjLFoX479/Ys1dYqsP6Hrvz8CUO3VvdZPwD+yuBFE8tQF4PpEVcloLdEZ4sLh
	9f2oT9efGHWt3eMHMWZxYc+MAVXC1wZhB1a7ArscNZg2Af40QiR9vYoSVqcii6PeA9cnk=
X-Received: by 2002:a05:6000:1004:b0:43d:7868:21db with SMTP id ffacd0b85a97d-43d786822b6mr12590363f8f.18.1776256656638;
        Wed, 15 Apr 2026 05:37:36 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d65asm5004581f8f.4.2026.04.15.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:37:36 -0700 (PDT)
Message-ID: <847de72350a1fe8bd765f2e5493b13e8bf7b2966.camel@suse.com>
Subject: Re: [PATCH v2 0/6] kselftests: livepatch: Adapt tests to be
 executed on 4.12 kernels
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Shuah Khan <shuah@kernel.org>, 	live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Wed, 15 Apr 2026 09:37:30 -0300
In-Reply-To: <alpine.LSU.2.21.2604151357350.1967@pobox.suse.cz>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
	 <alpine.LSU.2.21.2604151357350.1967@pobox.suse.cz>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-04-15 at 14:01 +0200, Miroslav Benes wrote:
> On Mon, 13 Apr 2026, Marcos Paulo de Souza wrote:
>=20
> > A new version of the patchset, with fewer patches now. Please take
> > a look!
> >=20
> > Original cover-letter:
> > These patches don't really change how the patches are run, just
> > skip
> > some tests on kernels that don't support a feature (like kprobe and
> > livepatched living together) or when a livepatch sysfs attribute is
> > missing.
> >=20
> > The last patch slightly adjusts check_result function to skip dmesg
> > messages on SLE kernels when a livepatch is removed.
> >=20
> > These patches are based on printk/for-next branch.
> >=20
> > Please review! Thanks!
> >=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
>=20
> Besides my comment for 1/6 and what Sashiko discovered, it looks good
> to=20
> me.
>=20
> However, please also take a look at brand new=20
> test_modules/test_klp_mod_target.c. It does not build on old kernels
> since=20
> they lack proc_create_single(). I think it should be covered in this
> patch=20
> set too.

I saw that yesterday as well, but I wanted to merge this series first.
I have plans to create a way to unregister the livepatches if something
fails, so we can continue to run the other tests. I was planning to fix
the test_klp_mod_target.c in the same patchset.

>=20
> Regards
> Miroslav
