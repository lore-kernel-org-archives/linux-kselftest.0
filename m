Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1C4A4411
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999660; cv=none; b=lfGl2SnSaOZ0mgimn5vkBgtzeP/lX/k5KHtfJIj5H1aFyvqaPf8HpgMbPF9o8pQImvt5XOUOaMmi7mdJgH7gVMxWvb56LtEOzS6iRg8ghBBaPjdMSNvc0J2yk90Zv6OYueuYaliy7422+q7eVsajcVqjjQ8+7ARAxGQ+iDYG8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999660; c=relaxed/simple;
	bh=H6U+NrUZCNS3U4kbSRRX3iFdpXv+xC/rYAKOBOA7VTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CoDyPdSL+ehrxo51fEOdZjjfhwC3rkDeGIA/ozQ7lYwzqnSfBgHYfuAQGrjaMCQ0yszfEdlfwN5XSw/YonSV3ST+T9LcmSRPBiNIVRvQ9w0uIDSrL7DrMVZM5tYDlaEXzYQ3ZmVs1UJ/lpyfZoscT4OdxhW2k0tcEheFJ0fAyMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wSgymvSC; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wSgymvSC"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd753a52bbso56735095ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999658; x=1790604458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AOZ0dxtbhNLe4ChlfbGRfBGQxKrpw6L19X975I6OgI=;
        b=wSgymvSCGSzFn+1174sAUEHfZDu/peAdoDs4/A0XGNTfo+I1bLVbtcghnCOOTf3Cux
         FcoroZVDR3RaURws6q5MRq4ciFhcDoNgj4d3ZDSLKfnXlVgJSL8CCBY7/qRjiSb7+cL6
         piJAxgdTRBCQZPJY28WFL+60Tzqss0wvALmi+goCeICOxytzLkUgwA4KAYZzc1vbdKFw
         frdxcN+qaDd1MplWboSGreWY4pJ+z1EYAPAAUrQh3RZr35CFbjjAKFEeSbdxpjFuszWR
         IkCGQrzQBR0hwYZD+ugtPX8Akb7PvpKI0feXaAe6y2h3gxptPaM4TPOdwJMViRFu0fpP
         b4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999658; x=1790604458;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AOZ0dxtbhNLe4ChlfbGRfBGQxKrpw6L19X975I6OgI=;
        b=fM747sKLb5gBroae7JXmemHow6brLsj/dsuoXw7rYyhebHPZlIMGm9ly01JHGWZqmK
         ddb60mYanucrBO4QgWS307BtOWw30aokoBl2dNrxMNqvtyEDHCK3vRPHLplPP3x2b5Fn
         5KRHwHfWlzXWz4RY/dPR5fWkc5AiTXNEZxIUrWUDgmvGClOIw9/HXZQKSevYrGMBaeQY
         oZ2tRn3uzFRn9InEH/+NCTe3k1KJ1uq3PH4AhrVn5vqtANA+dQgYHg60ZAIbIKCnwLCg
         om9WOn448deuDbhZUpwy4OMHAR3nSDMZ4r43QsbTs5UES/UppFzIsF7UoiSIqkoh4yJz
         Ox/g==
X-Forwarded-Encrypted: i=1; AKwUvBzJh06AGzlRqhZd4K3u3fmukC/mZ/k4gzlJHkY49Y/sF7a6iZA6mgEh6UXak8OaL4YhEXlHONiT4Gyv36Zl1TM=@vger.kernel.org
X-Gm-Message-State: AFuF++nC7TT2wadamk4OGESozDjkOYuik9ITrgoNZKejfaceYqTpI+6N
	TtT/Fm2BLVTki3fInkfAczoP66M63nwoTr244dMjDNoIhxHEsuAPWues7SyaYAHBjF9NuQ1aA9c
	A14vh5A==
X-Received: from plg10.prod.google.com ([2002:a17:902:c24a:b0:2dd:2c40:5497])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc84:b0:2dd:c053:a6f3
 with SMTP id d9443c01a7336-2ddc053a789mr109068815ad.37.1789999658205; Mon, 21
 Sep 2026 07:07:38 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:38 -0700
In-Reply-To: <20260901090839.3338955-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901090839.3338955-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999929029.756055.7044021691861299387.b4-ty@google.com>
Subject: Re: [PATCH] selftests: kvm: Check calloc() return in vcpu_get_reg_list()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, Josh Hilke <jrhilke@google.com>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 01 Sep 2026 09:08:38 +0000, Chaithanya Lagisetty wrote:
> vcpu_get_reg_list() allocates reg_list with calloc() and immediately
> dereferences it via reg_list->n without checking for allocation failure,
> unlike every other allocation in this file which is guarded by
> TEST_ASSERT(). If calloc() returns NULL the test crashes with a NULL
> pointer dereference instead of a clean failure message.
> 
> Add the missing TEST_ASSERT() check.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] selftests: kvm: Check calloc() return in vcpu_get_reg_list()
      https://github.com/kvm-x86/linux/commit/b57917fc2b26

--
https://github.com/kvm-x86/linux/tree/next
