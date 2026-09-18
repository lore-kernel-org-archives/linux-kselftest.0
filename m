Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D64E322F
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730684; cv=pass; b=Xh2d7stD26tp4hIWDmFur2Wfwevo0gABEl9ittr38jFCMAIEoX4mHr+90GlVuVbX3AsRNXWp90djthIcUo9ofxSzxpRMII+ns0KLbZZGPz3piurczoUhytS7PrKcvRPCzrviLAQ40MrteW9SAXsGVsGhx62BHn01SLQvzMLObxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730684; c=relaxed/simple;
	bh=uBnC6KA4mFvaE05vQovsBFoi0Ky2dT/n6cHsROU3IVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEyyaZuYI5XeeJKjMO/3G6qvi/xyzegeq/VvTt3JypcCTRX2sk2XPWdqwMSsPwDDQ03MAYDA5hgBMx/POvEx476FlIzGhhYjxN/ZPsUTAvFFlQPhQ96kc+bhaZcgxCjm9MqxxJ2Kkz+AevXN5h83hqmslr7VKw0wyAs8mCT5J0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o2Q+F0lQ; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o2Q+F0lQ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5287a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730680; cv=none;
        d=google.com; s=arc-20260327;
        b=OAJlBWwRo4/I2og58bURZTrjl7CG7/UvHrRhVICpdO57F8Sv0sP1Zd8xdcuyeCuvV2
         aP0eJHSKR886l67T3zQsjGYR+ge94u/bh0lvCzYbDhNGyaJjeOvjMsMYl5fWVnTjXYvK
         zwtq2KNaAgU0/YhT1M0EiHch/Q3WwR+nMdQioiJIJYUVpJ7QBU7Xf+TiRkBO+NqJxC+c
         Ey3nMhIBbyvfZ0VQwXd8PU283y9hBomx2dcPp5sE4Y+j0iNl3KDo7Hykq8qRYmy/ql1c
         Kgsy8OFsD9AKSf8/l5xSuvOy0DcrrVSzJDMbsjRUQPDq6T0/PWlAt5APx9WMSMV1KhIH
         mSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7a5izxf6YFzXYW8w93EbliwqXIbZagpn1chA3AffJ0A=;
        fh=zCWbTDSi6i2YpOaheKHVuMHQ2Mv6OtYXXvDd+CXNMBQ=;
        b=QQiUSlCJRM/8IiRTGg1SrKcKw9ZaiDD/vON001VYHZHJ6fhm6z0hKmCnwdQSQCMGGK
         YIhdeDmAqIR/0GyoQm9tiqoMOit4XPowpPOub69zeHMwsVfobt5+7X8xeKu2CarstF3u
         u9d7E6W8SBBwmjwBghWK/UW5pj/DwVLuuEQW6h8FzhcF99ZZtRIOoFMIRo7+xjjnV5qa
         9Bp/jWxNNOc1I9enlusKhBpUz1q4wl0o4bEtnk8sotXp+qN57IPaEkulmilY39pwIF6n
         VZdCZmyjD9345k7nSmgVyjy/qXg22Yzz0cqXs+mPcHDsPIQjvrc2bEUWKsS++Ch28bcy
         1NFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789730680; x=1790335480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a5izxf6YFzXYW8w93EbliwqXIbZagpn1chA3AffJ0A=;
        b=o2Q+F0lQUDOlildXI8CHt2tuRsVMh7RNL6NsE6gE7zgjPqAmIzvxc3mMaTj7iDJ4qi
         6Kp5a+pysfw40TIAlsZxZ81qAnHe9p8jcGmZhafR0URdMZeNWtJYjbEbv//VBmstq34Q
         cfFA+Z6vWvYXnpxPRiUztO6W7pQkJNT03gsbajeaTvTpSaumUYEplNxArRaBRur4ET4t
         35KT5FLGfSJx4qY8TCU2307Bp7bLztGVwTz31oNj+uPnnDVu69waNHuBvI+0TjgYLWxS
         3/C0xDli/wxKsDyCRJwF6coH7erjAVcivNN+Ztq0SCj29zTatEaDVCFSxmaayPOdWsL5
         LUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730680; x=1790335480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a5izxf6YFzXYW8w93EbliwqXIbZagpn1chA3AffJ0A=;
        b=161B9PdYHV79pOsTfMXw5wI2LAHsolZeoSETCCc5mJmFRqzbcLKrXPvFBTUm1Hjre1
         UVa7+XTBcUeSmQrFTLhmIKGExNe2tsrIPlhac1VIq8kuamphah3Ji6TOsKozopk1HvwV
         unloBqoYj1HXDWj1FSmqkTPKgqbOYAR50d9McPAazR3xkl0CDJnU+fK3Pbhearj/PxWt
         6Sm+DdShodAtwsQRAeIiyLmSHX7muzmSgOFDii5SprCLGE7Nc04cdY4x2eRBj3Mb5eKv
         JQqcUe/BeGeYd+ZCxPPNVuM21Bqtxb8wG89LIlqVtlbmIJAVWaWv7M9CoCD2pt1OGlXE
         d6qA==
X-Forwarded-Encrypted: i=1; AKwUvBxnpVWEz3ZnvbyKO1IkPnOrHxE8zFZs5DjkAWlwa9H9bGSHLUurSvv/rAky1OpYcL+lI6UtqJyAmPqQV0FtYM0=@vger.kernel.org
X-Gm-Message-State: AFuF++mT7l/UfzjS9Sz4SmxxYnwgLq0WzghkbnH/N2SWtz6JopmEab+6
	QSMWojh5LVWi0/tCOuQ+NLo44KjRxbJw8hCEh/PwTDIBx/ASHbnpeqDNjCfR8zJOlyTGxNkFqvT
	c3aw0OAMRlE54tPIBF3+SzyHzyA4Ssk/8NkMLZE7V
X-Gm-Gg: AYBFou0nRs3Qo7EPgiVjrkNBQvlueBcO3YxNUxdTTg0h7I2N7lWibMd6mFIsYF0lhnR
	TbsTvMShp0XOFVsXfx/5fHXhmp8OyuaAHM6mEzup08WzKUSIeSFiLla6Fdjo7Qcd6OPDAWw3QlA
	aNyc/W1Wa6yJLU5vIiSXwTiXgKb19Ft2Bk2cfSWaAXBXZH1LSfcD3xeQEhDpZY31r9mDYow5Iih
	y4qkm2XsaUTQ6BKnRGKVFqyLASUGEcbslkJy3exmXNjsrMU+iUFSiRqiI/hjwpDEEI+IS+qcAW8
	mQnuXUlY+JQ376qMi95rwwlBJLM66DJY9H8SJnA6V6L2Df4bzOpJqf1K
X-Received: by 2002:a05:6402:3c7:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6aa4df21b4amr30464a12.2.1789730679801; Fri, 18 Sep 2026
 04:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <1355f32599087e8f4d0740bb92ab5f0c9c329b6f.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <1355f32599087e8f4d0740bb92ab5f0c9c329b6f.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:24:27 -0700
X-Gm-Features: AcwNN1WGefe8mq1Aq8R2hXSQ4KSfm5bPolxygvJQEfdVJUvpg92P3z4X6vU4uvI
Message-ID: <CALMp9eTM3WN7idYYK3hhkuYgdDbwE94VTZB4F0fj33DTa1ExuQ@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] KVM: selftests: Add nested SVM DecodeAssists test
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Add a focused nested SVM selftest for DecodeAssists.  Verify that KVM
> exposes the feature to L1 and provides EXITINFO for representative
> MOV CR/DR, CLTS, INTn, INVLPG, and INVLPGA intercepts, including a
> MOV-to-CR0 selective intercept.  Check hardware and forced-emulation
> paths against the same expected values.  Poison the instruction-byte
> fields before each instruction-intercept test and verify that the byte
> count is cleared on exit.
>
> Exercise instruction bytes for hardware and synthesized #NPF/#PF exits.
> Cover a synthesized #NPF that follows a hardware #NPF in the same emulate=
d
> instruction, an unreadable instruction tail that leaves only the cached
> opcode, and the absence of bytes for an instruction-fetch #PF.  Modify th=
e
> MOVSB opcode while its MMIO read is pending to verify that the emulator's
> cached bytes are preserved.
>
> Inject a userspace #PF while an MMIO read is pending.  Verify that after
> MMIO completion, L1 receives instruction bytes from the current RIP,
> not the previous instruction's emulator cache.
>
> The hardware instruction-intercept, synthesized OUTSB #NPF, and
> userspace-injected #PF cases run by default.  The forced-emulation #PF
> and instruction-intercept paths require kvm.force_emulation_prefix=3D1.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>
