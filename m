Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DEC43C7DE
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448618; cv=pass; b=hpyEHA7u/xBdvvDy5tpJWc26Ucld2l/TcH1V97cCnbZuvd1XrKIJ8CX7NqiQiQV7zYXgT0Xs8SQgX4uPMLqQ4jOnbnFS90xvycaFAiXUbMyGNlN7wvMJ+rfxKboqTru5CJJUzCGk8lPUyMXjF7d/La9z393A5p4tLJjVx51WIHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448618; c=relaxed/simple;
	bh=rlf3tHuXC+J9H9qoGU4eEn6pWPRGEeYT1LPxkFxhje4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bH7CZEhSVYFHhkdKFu4erKp76lG3nUqyCgDiO3VDIfIUdCI6lO9epzsh94PKd3zKd9KwSRKZ+tu4025HtkeH5t3dSR97EQLTGeWACpVp3pAOViCxGVcseZrjjh80is9uG1blq0GeodY8oYr3K0nZEb0hTBWhhiXulMXkGyOnOD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MalPC7ts; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MalPC7ts"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so1159a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 11:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783448615; cv=none;
        d=google.com; s=arc-20260327;
        b=iznNAML3O8MSQVchwqmR5QFg6Kv5rGzUftmHFM+cfydWTJtOEfcwF/W0BdakFO4Ftd
         a7WuluBQRGlh6jvqmzr1YYujwdyAR9FtI4Ct5AGrdXxzdLeM5RJ/vguQsUbNo4ZrPuLj
         gTiWnRxHHKZsQY76ASPBo6q0Gb74fDPe8FrhryYsmC/F94ttPjPOpg70sQ2YrmRYt2CW
         fa2+oidkdF3U1T4hStwa+9pAwW4uQ9by2EQfhzWAp6uUQRlSdY8JBy7zS9wcx3UIqaDs
         cdSBrS5E3UnbKe6kypylJEKjzRcnB7pvF7wOZy2xSnoCpImqRywXK89Qe26bj0dbFsxE
         JvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n6UTQhybf0qp+uwC136gBcEg4wQiDp++XoD04H2aZkc=;
        fh=Gza8ckkdf4P0bekDg9keaPQLgug22dDcgs2wCsin74o=;
        b=bvE41K3rNYmYwQEqiyOtVeujdfVOSmfqoPriVRMeEc9GWJWhMcvrPQS24aaLmP5b3T
         qvWjGwKhICVdXQdM7/1TCe36XvLKCnZIjsSaseQAD1eWceCgvAgObnhOgZ++2+2YE/WH
         XGcXkRTbaay1Ik3fu8JPV/r9UoennRhyaRvbO/InXx3Rr0UXCza7E/VxyYZQUowGPPVw
         UWKta9clIRqOnnnK69g7s59HqTI4UyE/8/FrHBJEiX7ly4532acu0VkYc3smuZw+T1RG
         GjfiK08KVdGRdHCvz6ewdudke4jdgk1WsG3Crhyd99/1ZnzreYJBFKCYFFrCSL1wp2Nk
         3vFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783448615; x=1784053415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6UTQhybf0qp+uwC136gBcEg4wQiDp++XoD04H2aZkc=;
        b=MalPC7tsOEfl6t+SGqr5q1OkqWADzkKctrHvzVWlgdPyJmRePGZcDWuztqKmf+l5/Y
         U58VcvVBWMpUF/5pXXBl57dPBGax02dvdwI/PI6EqVabcZdjs1XYxuYiQsThhfyQ8Zru
         pF7JQaY3p8Dey6p9a3n7WIayP0IdhADVUHljnhFXRw9YPr7ieNXs9+QfiQIyNwQHhfml
         zta5TLZN/UkabDamuRIGvPihOMpN/qtz/RQT3Dfh+rNXcBhKE6JgKJXEjZ5Nhj6Tb9KB
         fba+3hHytRwgIWBDwmcBcSNCEGw7S2RMkbJgzvZ6ufLYddthvwN2P2rku++LB+PNlANm
         BSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448615; x=1784053415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6UTQhybf0qp+uwC136gBcEg4wQiDp++XoD04H2aZkc=;
        b=a2G/2hnL8D1tGKR6RSkIywZHCqiK1ABd0yLkgfGCfKdkpTCTmoS5PfkjXBslXw/Q8o
         QtyAKdfgH1NUr+JTQ/AxgyDW9YcHcEJWnw1+WVy0aJyqTwixHNH+S3Ck+5NcmyupHmdg
         bvgyZlIa1FjamBkiG6yFAR6+raF9R2AT/QLg8WR8S1oWMRoYkPjhAlS/EBT4l0Yxty61
         bXM+vL2E3VFut1zVsBl2NPJ/QXuqq4MRl2GwUM+phiv8oWg+7eiDcSKwXzSxYwdTxJ7R
         rwZvFOy7mEDTl6FKUXcI3FgGLUrMnxJ+tgE9LPx12jCsHMF3h/n4UjkwYLLaRL+fksON
         z7gA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2crF3lew7g6Uei2om0cS5hcr580ok9mNiAgFgbaHwuY5YOTyL4UoD7W0C1Nk4JiGwqtz7rilBQC7SwYJI++s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMh/vgGYIm08xcAR9eVlWyDVQx4Sh4+Y+B57d000Wx99otG81
	8xIuRVVnb6+5nzHVnrQKgPdLr8n6JJ/u1yxJQTYRTMccXdGNibqd7Ktj8cd7P5jRbbnw5TUBiae
	flNwYk/MzRGsA03QkblxDOQmSV6ncbfS3sCEdVphwGwuy461OLZUW77zCQy4=
X-Gm-Gg: AfdE7cm38DuEpeAzwdouEHf7iJ7KUxrLX4Z1ujiECc/LWiqgqeSUFWve9YfBJla0XGo
	s/kHb4mM5EveLB/tcOCeoRvTfc7C5fuqRtjNvyj+sFbFFdxS7IV6rrO+3nQPKWoEuE+/kTApWsa
	bviw+eAz371FYC1zoaf9Dp0TQyBNQE7DcRuoVXnRwKHrfmCDP65ZrVXeEJWF8VTLQoRsDaDZbtn
	q7hCEtPEucUPPzXxLoh/EV3gh2MqXv72RVlOxZKFRu3kkXHZscw1JS+ezGgJd4WO5OXj6uP
X-Received: by 2002:aa7:d614:0:b0:697:7f69:48e3 with SMTP id
 4fb4d7f45d1cf-69a9134f82amr62168a12.10.1783448614909; Tue, 07 Jul 2026
 11:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
 <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com>
 <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net> <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
 <d5645a47-c346-4e63-a5c6-c88bb39a3ee1@open-hieco.net> <akxwt1mX6blSnkxI@google.com>
 <CALMp9eTr0iJ5QgbZJ0YtOZg89XVFSesbyoGGdtkz+f8c60DcDA@mail.gmail.com>
 <ak0QE7mP_TeZmzeS@google.com> <CALMp9eTycB8Z94V8j-xyfDeah5KaJypRrPfFNHfQSUzgrr7FkQ@mail.gmail.com>
 <ak0dRzS4Ap-JREvg@google.com>
In-Reply-To: <ak0dRzS4Ap-JREvg@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Jul 2026 11:23:22 -0700
X-Gm-Features: AVVi8CdfxH9KPwBG1cPjxuI_GW1P0iEniD5Mku_K1NYa8qNEH3FQUGW2WLHpSig
Message-ID: <CALMp9eQ4JZ8E5BTr7Cde5M=djBg1oMNLbfn_ZoVPL62ijna3AQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Sean Christopherson <seanjc@google.com>
Cc: Tina Zhang <zhang_wei@open-hieco.net>, mlevitsk@redhat.com, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 8:37=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Tue, Jul 07, 2026, Jim Mattson wrote:
> > On Tue, Jul 7, 2026 at 7:41=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > >         insn =3D ctxt->fetch.data;
> > >         if (ctxt->eip =3D=3D kvm_rip_read(vcpu))
> > >                 insn_len =3D ctxt->fetch.end - ctxt->fetch.ptr;
> > >
> > >         for (len =3D X86_MAX_INSTRUCTION_LENGTH - insn_len; len >=3D =
0; len--) {
> > >                 if (!kvm_fetch_guest_virt(vcpu, kvm_rip_read(vcpu) + =
insn_len,
> > >                                           &insn[insn_len], len, NULL)=
)
> > >                         break;
> > >         }
> >
> > This split doesn't bother you?
>
> What split?  Do you mean reading some bytes from the emulator, and some a=
t the
> time of #VMEXIT?  If so: no.  IMO, the most important thing in practice i=
s to
> capture the actual bytes used to decode the instruction that led to the #=
NPF.

Yes, that was the split I was referring to.

> Exactly how and when the "CPU" reads the bytes is a micro-architectural d=
etail,
> so I don't have any qualms from an architectural-correctness perspective.

When I requested this feature, I think I made it clear that I wanted
the actual instruction bytes used to decode the instruction, rather
than bytes asynchronously fetched through the data path. It wasn't
until I encountered the Naples erratum that I realized AMD hadn't
implemented the feature as requested.

Since there is no guarantee that the instruction bytes are actually
relevant, I concede that 'exactly how and when the "CPU" reads the
bytes is a micro-architectural detail.'
