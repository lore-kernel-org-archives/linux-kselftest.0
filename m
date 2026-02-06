Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1330AABC
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770407404; cv=none; b=dOFGz3u866brbDBgz/582gfKIkPyiv02/DxD60KKd2Q1pTj1ObrL3yaMt5ccC/onunwQJ5b+0/yuupvDNtsQ5OzpvmM66iG+9xCIfDNlibX9eCA7Vd675GDdnpf/QW8f0zZYtvS3nEHaAF1yJU3GK1zmS/dkthcGd8S4La89UFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770407404; c=relaxed/simple;
	bh=TsEFJkcKhYzvgcG5/7ppTLt6u4oGU7jCOQ+Ejqe0MDI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AY1WKZLCJedp8jQckBDbodKN8kbsrEGrW+RShY75bRNtmvmK/jTopamyH/n7YwpCTs0uuUsHyO0Eb/3RV/3EEmlD8MY0bWbyLJX2pTPhQPWxlkwuGLFGWNrVaCPBTkggp7pAlTVuO3TcMb4s/CsnmpqFuDBgj5D4L7HB+I/iihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CgsXjoJz; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CgsXjoJz"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-81ecb6279d9so2501072b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770407404; x=1771012204; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1jJkQvNi67f2WiL1rB6LTa3epncK2iO2DDRLCaSJpk=;
        b=CgsXjoJzdtoSjjdXAD7DMhaOEe7SoLjp3nmJ6xlfFFmU2yoK9K1IH0yHilvsuQgC2d
         w6nU6RC3fGicS44KiT6/CxULGL21yHu8IkEtxp9S9nDtRh7Ro2RRkCSPU33z8BqhMi4C
         5pR3ozrOuXQileKtfVoNch5JGuXd90bBM5rMX60bsKfKTMeF94Iwh5oFR4QnitFCg37+
         dFm/rYupbizQpt2TmI7uzzaQ3866Kb+gY3srEzGSLaMogU79518veCFka4qFlZtpbqee
         jS6q/OQu+iwlYyu04kzMQpqWJJ6y529ipljGXJDx2/rE2meltloEa7p8Kl8k0gQtbzBa
         mWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770407404; x=1771012204;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1jJkQvNi67f2WiL1rB6LTa3epncK2iO2DDRLCaSJpk=;
        b=EgKpnsLBmpD8GBLGQDwSZ2+ofV1irsAP3zLTej8akwM6Q/qLpXfdSvvrhGna1LcP3q
         VECrQBo45uoea+KZSNlWv3+wum2eJ/22AzmoiMwalsCLCkBo5nW5JxPFJCYq2tA+3xnm
         hS4RbvF8Lg/8sCf63uz/N3iBdGjEUKKkBfudLcJXhAzavW2x4BQm7ug1xsY4DtiyrYZK
         rsZUZIycjCwKGcP5+BjrktmVxU55tZyRo5bBqw/vGKWedgW8OS7jrtpnVF8AmWIfvrG5
         Jlw8dLguoUx+n4/4m7I7EYZSY4lgWDAPln/akZUtrUfPaDmUiQhqVRN3EX1z8pyeiLnb
         ii1A==
X-Forwarded-Encrypted: i=1; AJvYcCXY62ajh5JIatxoZ0zzWS+pJ+3B+URcLlQ8oTxsrH+Whrb/9iLCN/YTxZcxc9JwCMudxkfXYFRLZ8k9iQL/0ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqech03ppq/kdEXnJVIdv7I9J8ujUkizKmmd4e2flu/OyDLqYk
	jlKD7Pnxbqi/KiPpsgd1h3jT0T8EoSZfwUINDMm+VImjrE2zYq7mE0iCD7EEbu2Iql9D68CS02W
	FhXsKQA==
X-Received: from pfbdi5.prod.google.com ([2002:a05:6a00:4805:b0:823:efc:21ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3914:b0:823:9e5:855e
 with SMTP id d2e1a72fcca58-824413c8e09mr3610811b3a.0.1770407403686; Fri, 06
 Feb 2026 11:50:03 -0800 (PST)
Date: Fri, 6 Feb 2026 11:50:02 -0800
In-Reply-To: <u566x5dz5a7trddlb3s6kustfvewdredrfldbu7yxlnl54wicp@tvzanbhtbmbd>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com> <20260205214326.1029278-3-jmattson@google.com>
 <aYYwwWjMDJQh6uDd@google.com> <fb750b1bb21bd47f85eb133d69b2c059188f4c05@linux.dev>
 <CALMp9eTJAD4Dc88egovSjV-N2YHd8G80ZP-dL5wXFDAC+WR6fA@mail.gmail.com>
 <aYY9JOMDBPDY48lA@google.com> <u566x5dz5a7trddlb3s6kustfvewdredrfldbu7yxlnl54wicp@tvzanbhtbmbd>
Message-ID: <aYZF6sYhDIdi-pvh@google.com>
Subject: Re: [PATCH v3 2/8] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 06, 2026, Yosry Ahmed wrote:
> On Fri, Feb 06, 2026 at 11:12:36AM -0800, Sean Christopherson wrote:
> > Oh, and if we do plumb in @ctrl to __nested_vmcb_check_save(), I vote to
> > opportunistically drop the useless single-use wrappers (probably in a standalone
> > patch to plumb in @ctrl).  E.g. (completely untested)
> 
> They are dropped by
> https://lore.kernel.org/kvm/20260206190851.860662-9-yosry.ahmed@linux.dev/.

At least I'm consistent?  Hmm.  Jim, can you base your next version on v5 of
Yosry's series?  I think when I apply, I'll splice in this series between patches
20 and 21.  I could resolve the conflicts when applying, but since I'll probably
tag these for stable@ as well, I'd rather apply patches that are closer to what
was posted.
