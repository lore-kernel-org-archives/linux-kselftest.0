Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2106152269E
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907133; cv=none; b=R3Ht40HmM+wuoKQqK85wspbbc9t4rw/4AhJsD7uwggsONUWGIoOpiRcHddFe3oLtAE5rOvPgKkB4e/XxvvWYPrgBV4VsvqNQGNPJBa6Vb9B3boHK+KXhdt6kFdM7YHMz6tjRjgquEi5477ux/zN+zwnNnTB8o9mPUjQ8QZH8Pjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907133; c=relaxed/simple;
	bh=we7GQLW48ewpf7gL0yHQpSstUw9okwSRbE2uUcRtOAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oY91fMeQ11EL9/Fn7+yhLw8xJ0I1ltCtYHe+4tPjhPb7InoB7yBD1mVwguezjz6EYrohCLJW41+siwToX6EMGzEGKDNAGhBZQFqerugfq6qvQv3H7mmECknVwy/14SqBOn/9hVJDTmzY27rpHLePPLik7DTLv56g1dtc8cxLA9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OXZcinze; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OXZcinze"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so2908958a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791907131; x=1792511931; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CcaGc7x43Lmmf57o9kW270RkoQygwK0STsr2qKvChI=;
        b=OXZcinzenbp3yyjpFxI7UiRWX6paM5ixDafNOUwSar+Ce3wVOp7EmRpF3JK3qHode1
         VWXjSyhh+BwY6dYSDpGmzMysAu+A53Com65dLkJKS0vCyDJ6pXxTFrAnAk9ibUHTLHNx
         jTp4mtto8tf2/unqgIgaJkmyBORQNIzBMQwee95gYrC2Q6RDp41t+aooIG8pj1wHWwd1
         +Z2LJvSHbYn8GGSbidxR6GcIRkboUZsuMvJLJZZ35j00f1xyP0gW/lToN66l3ZbbTqg8
         G+LXlBGt1P0miyvQea49eyWvuiatpNuLKtP4hfoqwNpihynmfBvgfkOV9VQGdz6th8BD
         RGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907131; x=1792511931;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CcaGc7x43Lmmf57o9kW270RkoQygwK0STsr2qKvChI=;
        b=oRtgd3tVLV1iEyNHivDv6dTkT/DuLISDrA/XxsHCqrqX8FiCYxBj0PxdbkvmXZNKF9
         1fUS803sSRnfj+y7QbtAI8mH/2BEbGRSOBjzQsiEhJywcEE4SZMGFZPmflfdgSl9LrAn
         Y269+bgRI6KdzMhljbsO0etq3Ox1qwGDEBF/fDBUbTwRupuSat5zh5YCM2l+IX8neRpy
         upMqnRFl9QbAjS7d51V4L21tnC6swfFwAlDCzGqYyg3ktcCwoV+NypqrnJGTlcVWU5Hv
         SsYP9u9lAhkuHz03wvNpsGaR8WSOYpEc40Jb/PigCPajULudnjbZQqYsfxs+4P8Hl/or
         78hg==
X-Forwarded-Encrypted: i=1; AKwUvBy0BD4KuQ42ARXkHvKxZ2tBTHWwif+jQL94pRhYX9iThD6qn2eTOHp3xYaKDf0TPajNAOLW+PqQaHP2RXaT97I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGS/SFeRprmLmBBCsdm4l+oLMOal5AX7BJpyi4nUVu913cR4ez
	7RQ1Oo86FjmVaPUj82UG+zymGpi9MU55+L8dm9dyLGlOEBW8jVfvHa8q0cZ/KT1eFqAMZYrdq3z
	+EhXt7w==
X-Received: from pjbbt14.prod.google.com ([2002:a17:90a:f00e:b0:3aa:fddd:36cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44d:b0:3a0:b312:1fbe
 with SMTP id 98e67ed59e1d1-3ab3a911731mr10196421a91.23.1791907131101; Tue, 13
 Oct 2026 08:58:51 -0700 (PDT)
Date: Tue, 13 Oct 2026 08:58:50 -0700
In-Reply-To: <d0d23c2b-493a-40f2-839e-45d8e1d9d833@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790171702.git.zhang_wei@open-hieco.net>
 <b614e927c6c1ce9265cb9a37b296b0b30598da72.1790171702.git.zhang_wei@open-hieco.net>
 <CALMp9eT1qMk7V7=md68LEXvmWH5ecj1YBn-YHoQ-vzJziaP5VA@mail.gmail.com>
 <ec1fb2e5-87c5-443f-9bd6-6983b96f63d7@open-hieco.net> <d0d23c2b-493a-40f2-839e-45d8e1d9d833@open-hieco.net>
Message-ID: <as5VOtJ6sItowUnt@google.com>
Subject: Re: [PATCH v8 5/8] KVM: nSVM: Fetch DecodeAssist bytes for
 synthesized faults
From: Sean Christopherson <seanjc@google.com>
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 13, 2026, Tina Zhang wrote:
> Hi Sean,
> 
> Just a gentle ping on this. I'd appreciate your thoughts when you have a
> chance.

This is on my TODO list, but it will be at least a week before I get to it (merge
window and other horrors).  Sorry :-(
