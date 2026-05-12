Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903A3AF646
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617501; cv=pass; b=c+gMpGeNxAod/Ccz0WWS0OdjHBSFB0cfUGsQQ/N1qQPlmzTzqjXqGwdT2SFOBFJabdw/8n78pXP33WYURDZ6nxdLvm2i5xQa5jqf83qrArtYlrr2DYAvlmQkRWAflB6BwyAzP2zLV3SP2t7NGVtBgsrB/GUt0PmyjTR1lv7Q1Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617501; c=relaxed/simple;
	bh=p1Dt2Pau45+gr9BBZWBbRM+0pqU8mWL0SwtrndPS4cI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBzkY/+YylNEFdWlHxyMT55jiqubOQRxqH9dzcUO/seFCe8+CChgNN1hip827zIH2Xl+iUjcZLY8qBfQoDAzZ9V7JmtH4J9Rzom9sbW4HxY3ndd3urBMEnQ1151vV0Fff3DZzxppj71C/5q0segqtpWZO5ZEEXnl90LDCqOL2Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ke+HVRC5; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ke+HVRC5"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5751136c561so4748850e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 13:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778617499; cv=none;
        d=google.com; s=arc-20240605;
        b=fwmdxP3m1TsPuZ4DgWlxo44P3hxrOrFGzzKXjs5hVoJVM7Q2Vkod0Q3A7OnXou3Wqu
         J4EeO9m5GNuSrHHmJIGFNvDyRwVl9iRzi0uZ/g6zv9Q0JVEd/BH5YYkUiaH7ioBXZqn7
         8gBqlf+kHl61h0QLz4zoA/OQ9HFdE3QeZpNLf6N5hdD4ygOU0Lp1UHGoEZjiBt/tAtpT
         VcI8MASTJcX6oM4iTZSDAmJGDQNzV8a9P5Z3bkRyOt4F6r5RKn3DyMiUNtnlBc/Hpy2W
         Zo6VxpBJq57iE+2pBVnKPsn9EpxN24ZY8N2U0KQPJ34sCyr9eNj5+M0ANH+5bQg3KTZZ
         WOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6A32fFSH9OPwjkkpWNRgZBSlRVvMKc+ege6TQRAjjbc=;
        fh=0TBJDd6EseShvftf+E1Z/8rIn7KmBqDjWTmNfMTVhoE=;
        b=Rp7bXMoBWqtvGan8ioTC4Smr8odCpIRbaVju9zpIRQPXrAxiqel4bFgQ/RHydToJv1
         yoQjL2SOFDOsn1m0/Re+GW05A0GwC8TiE4MhyMnCT3/Mlkr2U+aGfAYklza9sjqEDMRE
         iyc7IAr2cFNEP71eYR76htBNOwonS8yMYqcEzwv8dqFSWBFhiCpQyvR5c/CeUKADQGn6
         F6Fdp3jHUPCva6DP8hqb4W5NETQDN36hk68O8dxBAxsJdNCIYvDVdJ7u31xgfL2yTv85
         Y3vU4o/H4KLJKo9Q5QcjFQKTR+eVvJgngMsutklCm59Uu29uidGxR3WPPkXrZfqsqiRx
         7AFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778617499; x=1779222299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6A32fFSH9OPwjkkpWNRgZBSlRVvMKc+ege6TQRAjjbc=;
        b=Ke+HVRC5Axson/fPx69NHKv1kMSMzrBpU0e/d8rzsJbl7KnfxHHJQ9SlxHQyvDViHR
         +11AAD7I1vH2/gOvjo/2wd4kAb58+JYxrHOm+9uFEufz3M5YjiyoEoH9lwE9yuGfPCC6
         HJ9jgzjz9SMi39dtgoO2zO4CPHYf3arg6EgHlLPeR3MbXRx9wQ73Q1u/jO310MRQMap6
         L+jcJ392bfxrlA5Vka1/+YRACksqbijC/+jnvxncFnlO+Z4i9Bqr06KBXUACrdUBvSJ0
         ja6+F3xGmkRERBsdjYrhqUM8K6aqJAyAhD5uojYQ02o4mmST2HrIKBz5F7HSp4rBaTgc
         RNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617499; x=1779222299;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6A32fFSH9OPwjkkpWNRgZBSlRVvMKc+ege6TQRAjjbc=;
        b=GLLPwc9tJrdw5Dxcsj8uXwZ6sz0klyqJ0ixx5iKbP2YPDWGFRfYNOdgNMhCth9r5mK
         jFdwwNb0QtH1Q07SMSkP7tx3kteBgxa4iYLNwEOTD8yNFiSY5GaIoNLlk4hOJTBC+O9O
         VUpDyWSmGv1sXDi5ANlenU/4Gp8+jsbsK4hUw/hIWRM9GLKst4v3keKflT/tnosIAupw
         z1lSVqzRV43oemUWEnhmKbCff4vgag9E0iKZgSnXEKwwDlCkPoR05yoYeJKZkTRu6mAM
         LS759rCxPx1LkYrRIla2tCujOzxMHHIPxEkYNk8V5nU6lXajDs6sdk3ywGeQ3cgkbFmM
         K2rw==
X-Forwarded-Encrypted: i=1; AFNElJ9clL9hef+C4iAA3jNBZkjDbUD+QBgr0OcVYvjLbJQxakBXNJ0idbncukdrRZeSRE2/drKdpFuxtTG+0Znih2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPJNv2glZyOa/jj4dinR/e5084MKbd45nXg3EEJgLkTRscPe91
	QRVfcF/LR2n8iYunrNf7VJgIw92dHXYfX4hn5OMCIGcjdwh6U14LMEyjpu6PoQSRp9kbIb4CTyC
	vv6Dpxi7F/R6cKk9PcLXVBVpKrSVJQIu8oYzf9YLh
X-Gm-Gg: Acq92OH2GSUlFLHD6i27HXX9Y/hQ7V8p4NFWVyd5cBTK3fSAayYNHScbLAWEqQZdm4b
	F4A0eVCwY9gxCebXbWw+1KwIUJcqVVQzlMKzYROORZOr05kWiIkctgQmEVZIdetJabm8otiSyZj
	wD/F0Rks9ct/RKFe6YSv3nTa13h4ykaz/kWw0PtFv0GCj1/wC24BZe0NfgaG05crsjBPoKnm/Ri
	oz5n4Yj4uED1L9TAkbP+GIvZUCtSFVAQfbZjsnkuA2+rmhd9buKAxtZQC4fisRtDmWEFpvrm9qg
	+refFEdaU/e/yHUA6wAi4J8gCzZRZHAR0K0QUCWXZwAVIF80bJJoyg408rEl4DCqXkU6KVgYni/
	Qqr2Q
X-Received: by 2002:a05:6122:814:b0:575:9cb5:a87d with SMTP id
 71dfb90a1353d-575cfc6f98bmr1737434e0c.2.1778617498178; Tue, 12 May 2026
 13:24:58 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 13:24:57 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 13:24:57 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260511113759.610924-3-tabba@google.com>
References: <20260511113759.610924-1-tabba@google.com> <20260511113759.610924-3-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 May 2026 13:24:57 -0700
X-Gm-Features: AVHnY4JAG5WXg_aVbHSnEQMcpSlet0iZdAsV7gUZdzLesUHy1Hns5TF1STKi8r4
Message-ID: <CAEvNRgHfBqqC1K7enCPX3jqWE0smJ3E0NE=kUPSX7N7g5KQrvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Fix FD double-close in kvm_vm_release()
To: Fuad Tabba <tabba@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

I agree that perhaps in this case manually setting up the memslot after
mmap()-ing anonymous memory is better since it's more explicit about
what is being tested.

> kvm_vm_release() closes vmp->fd and vmp->kvm_fd unconditionally, and
> kvm_vm_free() calls kvm_vm_release() at teardown.  A test that calls
> kvm_vm_release() and then kvm_vm_free() without a
> vm_recreate_with_one_vcpu() in between double-closes both FDs.  Since
> kvm_close() asserts on close() failure, the second close trips
> TEST_ASSERT and aborts the test, or, if the FD was recycled, silently
> closes an unrelated file.
>

Never thought about this fd-recycling case, I think this change still
has value in avoiding the silent closing of some other file.

>
> [...snip...]
>
