Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770413A9013
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375819; cv=none; b=iqImj03pv72XGfwRMkT5hBzNWdKj6Cp05STpeNyKjRIT5G78GwPtBnkQM/JYZr8IqTJtZthR88zM1qfPp8O3heQFRNGZ4VX3VbzQHpaHNBaDnLtqpYEoVvh04FjkVD6ap1r4+G8htSK5QErTkhnSLLxmiEJXScBz8q914fS0tiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375819; c=relaxed/simple;
	bh=scRh2OdWbDi2c/x8JjbQezLmH0RD0LXwZD4IFksG6E0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e07+liCp/zFjWXVqRwhfzsP3FfW3mHWFjPZgr97e3EvlHy2K7MhUG43bkSyLWiVdYuabk/MvTWY8J/qHzPJzCrSUmqgQuiym54xou880t/PSMyCcmHggSv4EboougMt6ElcNVTk4iHry2XpiEfkMRGpxs4hAkDk+G5s0KjUcTr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvX5bNzc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rRqFmv93; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvX5bNzc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rRqFmv93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783375817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mah/HpZO5BAes8mn7X8WZEkXgN+0zHJkp+xqEAPaVEo=;
	b=DvX5bNzcsy02udzE4ALN9Atgypf74VjccqggMf7uJ8ECBR2z2fQUE36WO3D4ZPuMW2senD
	fYOfEQVmJLWBJwrqHoctOGBMrTBUhnZVLHN8etDRTV1GEuZi5tGrpJCa7nxy7pHLJn+1mQ
	ZtxAAImr4rv2CrK3ReQ8ppwo8XwOI6c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-iF_AOo4YMnag9NmErp6_lA-1; Mon, 06 Jul 2026 18:10:16 -0400
X-MC-Unique: iF_AOo4YMnag9NmErp6_lA-1
X-Mimecast-MFC-AGG-ID: iF_AOo4YMnag9NmErp6_lA_1783375816
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc92c5373bso8694256d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783375816; x=1783980616; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mah/HpZO5BAes8mn7X8WZEkXgN+0zHJkp+xqEAPaVEo=;
        b=rRqFmv93YAkuqRbmuA2N0poYHtxIKf0okDfRn56JL92Boi8aX9SAzpcGW4WC+6uPuT
         VCXLaDjpk6ajc0NUFeSoW1GP4ONd8d09Nr3oCNvmidDBjTNg0ffYJRKMCZMlaN0/WtHz
         IWaoPX8vtEMCVh+yoMGFBUgiWtJ9EX+5ofGYZQBDE9ihQYQPQtAJjy+psZgwzAt7Wiwz
         jOY54UUqb30rFy7dMHYSqVRWmwp5y9BpwVQkcrJ5BAtStBi2ri3GGMcwQE4HsvxUF4xY
         fnSG/weAsX1G1CEb0rjn7tB8THgHBjKBDnXyGCmQQV4Gq0c08d0Dx9o8wOnL9ksK+Gag
         Eoiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783375816; x=1783980616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mah/HpZO5BAes8mn7X8WZEkXgN+0zHJkp+xqEAPaVEo=;
        b=ji5YN/Z+gBfIfogmlTUR3AGf5ZxSz3Ds+apT2V7K7xMIT2RVlekpMt31RVr5eL2oqZ
         5Ms0iC7sHLkq94wGT9gR8lkkWRgMPvQWSHRuq+aEsVCVXmdPeX030yj7blJEBGtlCZhT
         nLfT0jdu82SjvdA1NbdelpUnsppp4dkrOy5nbGR/FiWiMvy/GDq+R9lzeJ6Gx+YWHmjn
         l4/YbpMK0RVMyuT58wN8JBionC2DsZj19OcKZO0R6b+L835ragIEZHFt4zPL31MycwxC
         arv1CgVIG+11ZeYICIe07SjBw7YUZxqaancpb5iaAVYsy/kMRFkcwFEG0zhoPrHGvn78
         kFRg==
X-Forwarded-Encrypted: i=1; AHgh+RrFa7S6fdXFMtqtH5sOTfjThRUy6NKyTFCmj7r5OXWrYB6+8oizLV4yUiEenuDko5usRBQUckiF031nYVgjQMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMHYDg21fouj1tN/SKdbTkSiu8gwgrcH22InskopubaOLOf4Z
	Seqr9BjnZ5ui3GDcscQXRmbFajJ9Ok5HBJK6VOqBpzHPFOUd1jTYffNywaFkCZ98qznWrsZ23Gj
	YHGqRCP/BBMm9iCY7FVJ8lcIdaicCrPF4f8pq62Wu1XXR4dYwJWzxJZGys5cZcnoUWttAGg==
X-Gm-Gg: AfdE7clJtEj90GU0XFX7h9s66XR+oqhG3a9KAUUPU7Gh8Novb7qwBUXlrP4jph4bkWD
	yyGgiSc115JMD+laMamHBhrOS9CE7kl8eNZuvZvvmjNZPTjzZQEnkR9Xte5Hz5bcxDSuRaV0HnW
	RNag2Zr3HhfgwnPQLkaIL4v1KItcVPaEvD9c7RVuVGKqw+K4cIKrk3ozCAQ3HazhJdLb1hV95EI
	HmrTkFVIx7IEsh0thQV4NXxylbt+dnwj0GRO/5v3xIHtZ7g7Jo+fViWMpxo6A3O/0KqzTHDC31E
	E1DsjrJNnTxXKjkL40RyRCrLjLlCfRiAfsneCDXariv2rlpeYMUflKnGcJk0OUPhNiqZ15D1NCL
	BytODQBs+Caok+dHzpqo=
X-Received: by 2002:a05:6214:2f8f:b0:8f1:64b4:421c with SMTP id 6a1803df08f44-8fcb648cce0mr33728066d6.57.1783375815647;
        Mon, 06 Jul 2026 15:10:15 -0700 (PDT)
X-Received: by 2002:a05:6214:2f8f:b0:8f1:64b4:421c with SMTP id 6a1803df08f44-8fcb648cce0mr33727646d6.57.1783375815069;
        Mon, 06 Jul 2026 15:10:15 -0700 (PDT)
Received: from intellaptop.lan ([2607:fea8:fc01:7d0d:91f2:ac3f:2776:92d6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30c04fsm156615146d6.22.2026.07.06.15.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:10:14 -0700 (PDT)
Message-ID: <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
From: mlevitsk@redhat.com
To: Jim Mattson <jmattson@google.com>, Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 zhouyanjing@hygon.cn,  linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 06 Jul 2026 18:10:12 -0400
In-Reply-To: <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
	 <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-06-30 at 08:52 -0700, Jim Mattson wrote:
> On Mon, Jun 29, 2026 at 5:57=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.=
net> wrote:
> >=20
> > The SVM DecodeAssists feature is reported in CPUID
> > Fn8000_000A_EDX[7].=C2=A0 When available, hardware provides the length =
and bytes
> > of the intercepted instruction in the VMCB, allowing a hypervisor to co=
nsume
> > the decode information directly instead of re-decoding the instruction =
in
> > software on relevant VM-Exit paths.
>=20
> DecodeAssists actually comprises four components:
> * GPR number in EXITINFO1 for MOV-CR and MOV-DR VM-exits
> * Software interrupt number in EXITINFO1 for INTn VM-exits
> * Linear address in EXITINFO1 for INVLPG[A] VM-exits
> * Guest instruction bytes and length in the VMCB for #NPF and #PF VM-exit=
s
>=20
> You only partially address the last component.
>=20
Yes, and I also remember when I implemented some of the optional SVM featur=
es,
I decided not to implement this, also because of the same reason - pass-thr=
ough
is easy but for all the emulated VM exits, it can be tricky to get that rig=
ht.

Best regards,
	Maxim Levitsky

