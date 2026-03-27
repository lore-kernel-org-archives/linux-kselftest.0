Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A262366801
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617853; cv=none; b=ORU/6ekoVmKm8BJFXu2JzUXTi9VsHndgd9Y+mPTUCNQKa0cJ3iSONPuT8rt57lwBpG+3hdxxDMgz3z9hW+hhCJmHq7vsKX/yOUt9JDW3PdzcY7kuxIw/SrodXRt8RWzfvlJdrBNSA17DsIcTwKYqQ9UrOAMo3nIYBr8+KHTN23M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617853; c=relaxed/simple;
	bh=ejXTOSKJ079hoJ09zoFLWAckjBH4CQ5r4z5w/ptDNg8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uge95mIO0JE27TLu8BDgUXvVUAg12n1lIV1Sj2L7PE7cMzYLXtXk4p2E74VNvP8CekrXGzT7d0HOgthiBqm8gkjm5JSVxW1Ni6z9zeCDe57Hc5DcwdxqWSvx8M8dSJk9q/aDhRbKLlVGD/fjFVkO86FOyD5mcebtTwppc+mErxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M2ab4atr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M2ab4atr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f454be5bso29627825e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 06:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774617851; x=1775222651; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6TxywXtHWHy04GPoczvW/ll5a4fKqL9h3PQIZK9hKE8=;
        b=M2ab4atrkhJnPVKZQm5tbkvLd0/8bz4Wq4qhdKxuo/HkUdHORElc+FIrvJu01vHzrk
         N1gG45aci2L1GONnKU+C8PwijofpunRWrGERq4PoAFhZ9XGDgzM3BiyvkyD+ThatXMFT
         9WifkhWwfTvZo+B+xreIzcnKh3bQZhJvt27W0B7XoxGclKeJSHg9P9wOEeOVIkFwApLM
         nRc53LUbuNImLGdAf3rnPlJRIEItxcXw5k2YtSIBCn7DuMcNDxnhHiSHXI5FqbOqVelb
         ujrKMiYxuXKIFfHNrEbU0tsED2lZA9XN18yXauUVdGsCHX+oCOSXzsDYP8s1nkngjQsl
         GUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617851; x=1775222651;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TxywXtHWHy04GPoczvW/ll5a4fKqL9h3PQIZK9hKE8=;
        b=lzU56taYsqw49SZvET+X4EYA3Lg5cCAGHN8pCLA+a3wVvccvfAMNuEpL2gfYMYff5l
         7oDxsWU58+aX9XnrPeQLTkZo0boxYmKsGCtUqUREsMN8zPeUtGNDTh5IHXi5iW27WcKB
         Sk34QKntNYOI3PuAewQ43xGblnHsbarso+jZZU4P45ONSdVvVd/A3+YOv715Qo+V+JS2
         /J5PWdV8sEYiNCEuqkWwwh9Ey55KI+ujpJ7QlCFakKW9b4q3yG5Z6auNYkHW1o7/xYLH
         tUyWWFVBOSdTEZgKzLUQ2NR2RLT3ZdaY6diyKETI7fhz5jdM8rp2DzU18pWprqGkX6Le
         u+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVbmzkExgcvz1odo0JJ1jr8kc8Zq+4b3ODs4lwz3/Ja34d1zFYI3ha84iIYZvPv5PXUYVGvc6xhUtkP1VZvrrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYnxz8xCWexFqI7kklkCk+e3p+w06P89gG6L57Qiqrz7U9y2S4
	hnU+9NfhGhfhv9h2lPObwo26eJFxTqrRYGtn5q0lSOXKmWiMoYkyQRdvE3osrSUIF9iVnnzgKBA
	qWFYS548=
X-Gm-Gg: ATEYQzwhKb5bfcy9GsP8FLXNeLRwDiN9w/gj6oGuu2kwrPFhIQTvQBCysA0/0kWi0Kt
	QMmK8JGFbFahI+Eq+xEHERs5SPlLSZyPkHfHHV30jqrD4PyezBDptKy2vMrTqySYk8+Wi1acqmf
	TUOWsLFedIoPFliZrpIOP78HafLgDzNFngsjECNVGyy6SO3rw4kdiQBwyKKsRutqpMkgPzkKsuA
	GGJFhBqlABwy5DYWYUqMUsHCOfuBsHXJZlaI0Ay6+bp3BqqE717y6USCABtZHbWMoqy0QLJMX14
	HAq6e5nHoL6VeicJqzmdRm70XsAVVH39FevTV1DA/A5e1D38zS1eO7p0gpIDVCWa774EvdcwnvH
	YobhheqOepSsjazjlQqCyfnQJWXhC7sA6CQ+/qWtqTdmy3EHAsiS+WYYBkNKRlxAtG5Y6ewhUtv
	589BFkcp2Ji9y8BFmvSdZzMe1+t24GJGaFz/i+C7fSvCyZeYxRTutGBAtYGWeWJWbPooYJvA==
X-Received: by 2002:a05:600c:46ce:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-487290a929fmr33140695e9.3.1774617850566;
        Fri, 27 Mar 2026 06:24:10 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:c8ca:fb24:208a:b63f? ([2804:1bc4:224:7800:c8ca:fb24:208a:b63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d2abb8sm18514315e9.0.2026.03.27.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:24:10 -0700 (PDT)
Message-ID: <9a72dbd0523254209a733ec9e89466e7f0dc3e00.camel@suse.com>
Subject: Re: [PATCH 1/8] selftests: livepatch: test-syscall: Check for
 ARCH_HAS_SYSCALL_WRAPPER
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>,  Jiri Kosina <jikos@kernel.org>, Petr Mladek
 <pmladek@suse.com>, Shuah Khan <shuah@kernel.org>, 
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Mar 2026 10:24:05 -0300
In-Reply-To: <alpine.LSU.2.21.2603201136401.12616@pobox.suse.cz>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
	  <20260313-lp-tests-old-fixes-v1-1-71ac6dfb3253@suse.com>
	  <abhjYtyveer4niGM@redhat.com>
	  <alpine.LSU.2.21.2603191349440.22987@pobox.suse.cz>
	 <0d85d8d7533a7a78d1f8fcc1fff8ffc73b1cf225.camel@suse.com>
	 <alpine.LSU.2.21.2603201136401.12616@pobox.suse.cz>
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

On Fri, 2026-03-20 at 11:45 +0100, Miroslav Benes wrote:
> > > So I would perhaps prefer to stay with the logic that defines
> > > FN_PREFIX=20
> > > per architecture and has also #else branch for the rest. And more
> > > comments=20
> > > never hurt.
> >=20
> > Agreed.
>=20
> Hm, so I thought about a bit more and I very likely misunderstood the
> motivation behind the patch. I will speculate and correct me if I am=20
> wrong, please. The idea behind the whole patch set is to make the=20
> selftests run on older kernels which I think is something we should=20
> support. The issue is that old kernels (like mentioned 4.12) do not
> have=20
> syscall wrappers at all. getpid() syscall is just plain old
> sys_getpid=20
> there and not the current __x64_sys_getpid on x86. The patch fixes it
> by checking CONFIG_ARCH_HAS_SYSCALL_WRAPPER and defining FN_PREFIX=20
> accordingly.

Exactly. The definition was added on

  commit 1bd21c6c21e848996339508d3ffb106d505256a8
  Author: Dominik Brodowski <linux@dominikbrodowski.net>
  Date:   Thu Apr 5 11:53:01 2018 +0200
 =20
      syscalls/core: Introduce CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy

>=20
> So, if this is correct, I think it should be done differently. We
> should=20
> have something like syscall_wrapper.h which would define FN_PREFIX
> for=20
> the supported architectures and different kernel versions since the=20
> wrappers may have changed a couple of times during the history. In
> that=20
> case there could then be an #else branch which might just error out
> with=20
> the message to add proper syscall wrapper naming.

Well, it seems too much for a simple test to me, but I can do that, no
problem.

>=20
> The changelog then should explain it because it is not in fact tight
> to=20
> powerpc.

Makes sense, I'll change it.

>=20
> What do you think? Am I off again?

I agree with everything, but adding another header file seems a little
too much work for a simple test case, but it's doable. Let me work on
it.

>=20
> Miroslav
