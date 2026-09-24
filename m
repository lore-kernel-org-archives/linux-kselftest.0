Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7564AAC5F
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273968; cv=none; b=QKPt/4WwDJ38eYlkY42N0thx54BmcivSd5YG8+Awm4Pn4qTRAAypQqR+nm44Y4EE4v8T9kUDoR05lrcE4oy60uB68QPN5jXpT8upyuovhWkAuVOEr2l4wKkdSmgHHnICE5ZtZBbKVAVoJh6uyX0dJqTt0J1/9naDFnGR7+oXiKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273968; c=relaxed/simple;
	bh=IvUR2431T4OLwHWTHJUJSLYNuzeAJuOHiFRGzJguyA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBaddg0ZQTYAQB5d1D6NIlNsM/Ly4aUn9MvKk53ixHuPGanS9+f7OnYjSWqT8yIYfSl6sjQCh2kGgXFzC14VqqPf2iKoKUFMaj84iyRmz5JCWHkss5DSA/IFb87gNIKgwwC4lfFo5fbtfGvFN/mAgoAPmfvlCDMxw4YRrl+yJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kjsKCtRX; arc=none smtp.client-ip=91.218.175.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kjsKCtRX"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IvUR2431T4OLwHWTHJUJSLYNuzeAJuOHiFRGzJguyA8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790273964; v=1; x=1790878764;
 b=kjsKCtRXIqG4QH2wQZyEg+X8YJPcg9dCxfnIUJWKoL9rsxzPjHSaS08FE+DrlB39h5bS15Sc
 hvtqmsaXbWLsVjQyqyhgSg+a7l4wrew8htzHcpxR1PmDTc98s088Ndcl8B/RGT7YCwqPrtB0XMg
 cYs9Ek/fE5o/BKn+N9oQAeVo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8c8f96667115ae10;
	Thu, 24 Sep 2026 18:19:24 +0000
X-Mizu-Trace-ID: 8c8f96667115ae10
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso969e87.1
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 11:19:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw97qXlkGU0JM5gpPXl9/8khw1/dE/+KbyOyH0nQApGqOBCkwQRU+D6OXKCjdpZkCUxB/YCVdibJj0PqQpWZ00=@vger.kernel.org
X-Gm-Message-State: AFuF++mrGUj0yQz09DP9KWuq5ervEV1ZlSAYW6IbaIoSBIwH/SPS01QS
	+FUSz3csODXfCrP368op0pZntiWVHrV7tHgt27qNj1lHZEx/PbhJBYkDpQDD90a04FeqGzJx2RG
	lVtJDNF5vRW9bXWssu0p5LhjUa3sOlX7fOGyMzJf2
X-Received: by 2002:a05:6512:3ca9:b0:5b8:e262:d32e with SMTP id
 2adb3069b0e04-5b8e57821dcmr16882e87.1.1790273959309; Thu, 24 Sep 2026
 11:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev> <20260922071945.693714-2-fuad.tabba@linux.dev>
 <arVQutV75u2gGVr4@google.com>
In-Reply-To: <arVQutV75u2gGVr4@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 19:18:43 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz=n2Tnq73amL3cok0=_vn-cigesdd1r-emt=+__Xatog@mail.gmail.com>
X-Gm-Features: AclHuK8gQuMnh5G0uSWpcfUI1aukInqrdbq0WmB1N5HLh0hWNnycc7FfERA0vUQ
Message-ID: <CA+EHjTz=n2Tnq73amL3cok0=_vn-cigesdd1r-emt=+__Xatog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: selftests: Fix arm64 sysreg header dependencies
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Thu, 24 Sep 2026 17:32:58 +0100, Sean Christopherson
<seanjc@google.com> wrote:
[...]
> Definitely doesn't have to be now, but at some point should we split out some of
> this arch-specific sub-Makefiles?  It's nice not having to hunt around to figure
> out which tests are supported by which arch, but the amount of arch specific goo
> we're accruing is getting unwieldy.

I think so. I'd keep the test lists where they are and move the
per-arch build logic (the ifeq ($(ARCH),...) blocks) into arch-specific
sub-Makefiles. I could send that as a follow-up once this patch lands.

Cheers,
/fuad
