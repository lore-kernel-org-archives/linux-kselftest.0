Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005122C0F7F
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957137; cv=pass; b=WvjkQJJx1JLfPJOZHenBfe1ze7bnCdYFoLfbKJRGzNocAJesXl1me6bRNifu9nnawgQAPDITFkysx/8aGojXWQ9Oyg7EQDd2cnWnMATYtteM7JE4HEjx9SeMO6AFgtxGCkA7poR5u4qcM4Xpu5HNgj128SG5s2+1jrKKW99FZ7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957137; c=relaxed/simple;
	bh=/DInnSeaoLZAZmw5wmXhI5ZdMMTrfFLw8yTfVLpjKME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4vLdLGYtc9ItN1Y5LGEiXiq/j4Yw14oMcEkKfV25j9sv0FMwDkY7iABVdNOjl/4f0jWYCdNCdMLH8pa5vFFlBW64MV5kRrx3xFJa3MLCK2RN9a2fFhDiAkQb9r02cyTHJlQFYz6udT0wDkC+g6e+zD1qT3hDJIj81bVF+2AUd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NblcGDHY; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NblcGDHY"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65f3a35ff13so780a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771957134; cv=none;
        d=google.com; s=arc-20240605;
        b=AJa9lavFrRa7aVulDWhvV94hyahDnKGmequJCv1Atz/iEVGTxaTSwbKs2DllwAF9kL
         aeGet50g3Zpt1/j5/CWus8WL9NCRNbVRRwzC5C6H8gfz/rWGaAurQC059OeFyDEAzN77
         pq6RYTPhXUUtjtE31xo/Etvi/8eyDkD/EmpukBaIODkFa9zrZ74wtQmDQXgVgOOlePqe
         eFnTNwivVcW0zl2PNu5+5xxNAAI3/V0ajIW+YqJeUFlBO5edC6EPGV5G0Xp+jSW8dlfu
         d3S4pB0ZSkuHZPAoMtE+uGgKU572RbXPp0jQWjPpc+hCscfu3ZdeE+SEnU3CKvyHCsqx
         JeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1t5kUOC5ngZkB1png7EJ1xy3Qbr1wcwSm9sEBW7YHTM=;
        fh=AwZt1Kfcj+LR2B+/ij6Mt75Hq2Y38hwFuUQvMaXOCOQ=;
        b=Kyp0a6K+Ll9zq5GZuR3MHegovQarji4AOWFAcJSkQyWHBwYysVeUkFOKe1FAwt24Jj
         rz4fq30lxjX/a0WfvuCAZzbBLO7l0uyJNrAbbpSjrkCQi2PJf9kk5go6I9nen1vthH5F
         WY6PRgJjnFQo1HmAXagLbzny0ZFA4J/vjtKzPxCBpQz15pSEgW2QuIywi04IOFklMD4g
         RbVFzkT5Rppqn0n+O5rn/gSPhZRALT6L08UoWu5tXt1gojlVG44+e1PrMNfwjpcdmnvX
         qTzgwieY6cCJYlzzuqbnrSx45v+UPerjGqwLOCq6uVgJHGulWu1tmvF5fpWPe0CojwP3
         /srQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771957134; x=1772561934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1t5kUOC5ngZkB1png7EJ1xy3Qbr1wcwSm9sEBW7YHTM=;
        b=NblcGDHY82ivd8gADwpvAeTKgaKMe1XcuefO45YXP2bOjC5q0OtTInGo6sSa2eJ/AG
         PnWjdaRk2YSYDVxs4cYu50cxZJluZ8+KeNyNSAWCKJue3YN01Th4bHBFCf87/pKRhoLq
         MIr4cbYMfcYS7tcmW9CeMXxPkgpd1qUqxLm4XaVpZK4dZyQyk7KuTBdy9P0womToQ6KC
         /UwMSfhNUngIc17qltiMslw5NoceQRIFuKpAnKVckWAGB2TAgP81YwwcaNBe4ZVjh/Zu
         Ufb9WaVq4OQCACg9iOcYpkG5Wfp0gMafqWQNxFArGCEr7nu4JJhGwNwDXX7b3UF72zEg
         ZaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771957134; x=1772561934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1t5kUOC5ngZkB1png7EJ1xy3Qbr1wcwSm9sEBW7YHTM=;
        b=KMCWJyAgaratqXnRQ37Sn2bIWRfz+4kMLbvtbXMl5BNvy9G41UIDxXMpJN/Lt16qMG
         emjRTfgeKpm48ETS6QOQH5JOuytvTGiVCW2zYvbfeIo9aA2TGZoNXJ4u4mx6Nu5whfqE
         7pwnxW7wyUJXvcLeLE0AQsshV900MCSKAQNcSuTtphiAP5wlXjEOCP6jCq2+Zd+VIg+P
         0NAgkfLD0dAQu10ArJg+mgoaNvw04N4GVaX89lxYDBcC6kS4Rj+1dGDzxyJe8zSnHGqY
         sdn24h789sTubtSHr3G+Y+0OidtKMVY0tL62uyC629NYwKgN7hWLzOE7SZp3/jKakM+H
         JM6w==
X-Forwarded-Encrypted: i=1; AJvYcCUstMb0JuxPOl8dqgxQyHbv5DMRKqSwTRiG2l30dcmKGOA7NBVWnVTkSOPbtkVZkx0dVaS7X7nC3aXWxOL3P1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ntt/NsbRkUrvC70/zZ+FnjsQrJNb4RiE6x2b6PSXWHzuC3V4
	ZbU3biGMBDiccShdX3XsdW0dYYSEse3fMh61WXssAu4DwsfSYH8vhU66xQWrJL2b9W60LWdMc0Y
	0iLo2eyaaeGlMNJJqkAvJ3mNchjDx+qFg4J8CYp29hAlUhEwcFprKi72i
X-Gm-Gg: ATEYQzx1UkH2nzDXlgl/2tj86QfzrPl7f6Ttcr9xsjqc/B/0F79/4aboczLQV9/XBQB
	rdcJPiUN0zIYfnVBgw/FUs5HWWZaOUWjEcvI1gKCmah5p85F+BPB+o5ou3YUToiz8Gu7DjWWoQJ
	BDFIEE+LdFdoRkS08GF+l13oZs3GI1zp+znDFUNbPSITgosynvTNaDYH2VohBI8qtZx3UeiRGm/
	45iCRaKxickD/ZnwBtvlWXUueJpUpgSBlOOmfU8teXI8q8ovrKiupYSq4WuejR0R6/8VUgzF0oV
	S0oN3Hk=
X-Received: by 2002:a05:6402:1a53:b0:65f:8150:dd22 with SMTP id
 4fb4d7f45d1cf-65f823aa5efmr3093a12.0.1771957133943; Tue, 24 Feb 2026 10:18:53
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com> <20260224005500.1471972-6-jmattson@google.com>
 <aZ3jQ1prL4dgG0-H@google.com>
In-Reply-To: <aZ3jQ1prL4dgG0-H@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 24 Feb 2026 10:18:41 -0800
X-Gm-Features: AaiRm52c8JAGwdPAWh6exvs0BRa9dbVeXCRtPz-0PH5xfDP68TtYBoYmhdbYOcE
Message-ID: <CALMp9eSk_TdpHj5OH7W1P8hnT=y4YCS8490KX5PfpG3R4TLt0Q@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] KVM: x86: nSVM: Redirect IA32_PAT accesses to
 either hPAT or gPAT
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 9:43=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> Overall, this LGTM.  For this particular code, any objection to using ear=
ly
> returns to reduce indentation?  The else branch above is a bit gnarly, es=
pecially
> when legacy_gpat_semantics comes along.
> ...
> I can fixup when applying (unless you and/or Yosry object).

No objection.
