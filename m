Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AF386C24
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784722; cv=none; b=szQTc6d6g2d6QJxj165gq5iJ4r3w5+BsbFy0Ck8pysNEz0K05oR9tIfl1KTHGGvb1r7m8qdY9gL+WZSUIK7fsZccykscGvpezapS/WP8eHrJsxJPRQhRMfhsNR5H/4AvzPV51uTi4hF0Dr/G47ffp06LqReHEHGCH6ZLSy4b70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784722; c=relaxed/simple;
	bh=ipknFUVY08c/OyZgQ4DVl3qiLBlNgpQ78duTHUZvTDw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=abUPrx9tZ3KXZGjrD7QRNGOg2YNVpdIVRV/7ADKCZxNLfCkIv+XFD0KzeBd3ixFPTVylDGqZ5RvQD0HK7gcvBhOW0QHC7SYJ8UdSlkq/YEZKzY5+jLAPuczq9AxieOOh0tZwKiOcLo2/OGZQR+1Ta1hwOVhGz3qUHFRBvACUSQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HygN+v5b; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HygN+v5b"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso5705221b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778784720; x=1779389520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrX8LRwW1PSowT2YAxKZhUffJgpdoyd8g+oYXgBSXz4=;
        b=HygN+v5bmJQ2SOEwihA5XmQH4kFq3Du1p5Jo9NppFYxL/zKEnV+WwMcvOz16BYcuyL
         lMAriCu7jWkTPN4bIN5IkfteM4AmdM9q7wpFOaUDS+nSMVrb7Bhr2a8dic0XES/3lvaP
         ksIsTwt5W2azNlA6HzsNkBc1XnW1t+Hx8zNwPPEtTAlRXXcIwlNigNd0GlDjn80EYhzc
         8Dz2jKVG3w15nNk9moy1rrjKEj2F48Ndcv3kYFU/0fJAOBNFWXIlqgdZcdey9SPU76qN
         gbje/fdMbI840scK2jdgzzVvbly9ScmZyUhbayEKokdkUfPYur5b3DuWb7fxiZK0RAf+
         q4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784720; x=1779389520;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JrX8LRwW1PSowT2YAxKZhUffJgpdoyd8g+oYXgBSXz4=;
        b=c+2G0ESnQo9IlgAsa3IkA0CbhUySaQpdh8HKMxsONuLxBdhh5vqZi9WZmmD0Pey+xK
         YJSH3cPpxpECb3cfq6M54vW9J6e2Lw7439IhfgjUiy+/6TvLHAhvZi/hLE0n5BrBPxoB
         KwGZ/JrWHhY3WWdCJ1HyGrxrHNZ/f+VQaxi1iJW7tgBh6ujb3Ooh6hA/YfKHEiJJqHHl
         y05r2qlhNXB/1nodeDzeGGoVNP6Acjj4pkwRWf9ULBQ9DZH9gTbSB3v9h3lFeId92LWi
         XjO3l9xl/78V38um2kylj/IL/t69slwHRpoqDi6dlTS66SRe3RNrLuLH6SxbKSGQ2pg2
         K6DA==
X-Forwarded-Encrypted: i=1; AFNElJ/r+TwY+F3AX9uM4CZ9X6g5vgY2WzDomAAzLjYaLALLAkS3pjJ5LAtfbEh4KIwF4GFnW1TjSLUK3uCIv4gqhPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTbvhrbaRRaZ7m4eBUpN8uYnhyNgtlOsS0zywmPb923dXiRUd
	YNJ6gFhOVw3wTRqaTEjmo7gfmsPBgoX0DH2SgXQE978q8imgQf2/p9EHLgZDp4zYqMRiYj9dT2c
	1iB/NHA==
X-Received: from pfnc7.prod.google.com ([2002:aa7:81c7:0:b0:83e:d99d:7c4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:cd4:b0:82f:5d4f:7355
 with SMTP id d2e1a72fcca58-83f33cbcc50mr861095b3a.33.1778784720342; Thu, 14
 May 2026 11:52:00 -0700 (PDT)
Date: Thu, 14 May 2026 11:51:59 -0700
In-Reply-To: <20260514053105.GA109150@k08j02272.eu95sqa>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1766066076.git.houwenlong.hwl@antgroup.com>
 <e0df5d6812da0f508cdf697ac7627693199c8293.1766066076.git.houwenlong.hwl@antgroup.com>
 <agUFxrpUhBRv54ZV@google.com> <20260514053105.GA109150@k08j02272.eu95sqa>
Message-ID: <agYZz7D6OXsEIEYF@google.com>
Subject: Re: [PATCH v2 9/9] KVM: selftests: Verify 'BS' bit checking in
 pending debug exception state during VM-Entry
From: Sean Christopherson <seanjc@google.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: kvm@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026, Hou Wenlong wrote:
> On Wed, May 13, 2026 at 04:14:14PM -0700, Sean Christopherson wrote:
> > On Thu, Dec 18, 2025, Hou Wenlong wrote:
> > > +static void guest_irq_handler(struct ex_regs *regs)
> > > +{
> > > +	unsigned long target_rip =3D CAST_TO_RIP(fep_bd_start);
> > > +
> > > +	__GUEST_ASSERT(regs->rip =3D=3D target_rip, "IRQ: unexpected rip 0x=
%lx (should be 0x%lx)",
> > > +		       regs->rip, target_rip);
> >=20
> > This is wrong, and the test fails with your series applied verbatim.  T=
he IRQ
> > will arrive at fep_sti_start, because RFLAGS.IF=3D0 from the CLI at the=
 end of the
> > ss_start block, and remains that way across fep_bd_start.   And to make=
 things
> > even more confusing, the IRQ arrives on the CLI even though it's in an =
STI shadow
> > due to #DBs not being subjected to _STI_ shadows on Intel, only to MOV-=
SS/POP-SS
> > shadows.  I.e. the #DB lands on CLI, pushes RFLAGS.IF=3D1 on the stack,=
 and then
> > the subsequent IRET from guest_db_handler() fully unmasks IRQs, and voi=
la.
>=20
> Yes, the RIP here should be 'fep_sti_start'. This was a stupid mistake,
> and I=E2=80=99m very sorry about that. In my reply to v1[0] I explained w=
hy an IRQ
> handler is needed, so in v2 I added comments and an additional check,
> and I tested it before sending. However, it looks like the patch differs
> from what I had locally=E2=80=94my code management was a bit messy.

...

> I have tested it on both Intel and AMD. Please let me know if I should
> resend a v3 of this patch.

No need, I'm actually going to send a v3 of the entire series (beleated fee=
dback
on patch 6 incoming...).
