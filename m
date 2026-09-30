Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757C5187DE
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790792485; cv=none; b=I6IzqpvJYA1Mms2nIvoGu4d+rgnBCo8Qyvaez3Xizs8eVaDkL8tlL61qeYMDcxuh3o0KDB781L3wnI0XueiDaBzW759GDXcRjqmijhgqdHTIXI7M34mvqtuh8aAYQhCXKJX7PjZSmPAfVdPYv6/jeGSx/9n/j+497XkwzLmuQHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790792485; c=relaxed/simple;
	bh=RIBmG7T5GhMUhIGxO0Hp7Z1fyqLfGep9Ek3+Z8JVsig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hLDvdjKYE3++uqNWq7kAzeRaaOJLV+N9wJlqMro/9RMRNG5Hrt1DXNXAOlPzKTC4NBViT+FApbGF/7e10vexqwXK+oRKw59FXjSEio5PyEK1ktKClelasyGIkOtMf9w7pUD6zFtIql+poysmWzsi4kFj6LqGhSLLLjgMc8yXSq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aOroD+4h; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aOroD+4h"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso2053550a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790792483; x=1791397283; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6jmdTOoqfk9NpdkdE3nQvbuTvNJoC6kAafCKfbFDU0=;
        b=aOroD+4hNXqlVvnuKIT61n1rhnl+eZqvlQxXD0sqX5Hal6lMJqTXlPW/zVSwHav/AS
         vfvgU+GE8nhwu69DrWyWRQeGhnmUycUP9VlQcmFbqbRftZH3Btxu+h1+8bOuF/q8PelK
         BheyCVPGzNJlrVa7XpXa0SoOT3ZlMMQeq/5TFvIYHIf+DgIh4ask6p1Xn9AZKBAg2KNc
         nJ9LJXt6HXF1B+tBs8owLaR2GyCD9E7zsbOx7z/F7OyUSMmiruwJE7j9iYlEwoTnhiPY
         uzWcmciFZEEeZsk3BHQ+DZtpxLDTV7GL9yhDLFp2Bo4hquMlZI8UOB6g132G4Okf1inp
         tpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790792483; x=1791397283;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6jmdTOoqfk9NpdkdE3nQvbuTvNJoC6kAafCKfbFDU0=;
        b=CLVcjFOhWxNeJsl4JzYZRCLG3q06Q2FBnukom3J7t6MFGRwIcLA9aUxKHTgI+S8aGN
         LEd/FsCY76nu4OWR5UOae3HkN7+2uho9lQVwDmmAzfz6IuGzE8Mguz7U/pygp1szqdzx
         qdcUYW59HIoa2pVzlrIv9omrkZSvmpylIW3HtfDnzWlfz07Wp0ttquyAHCiueYh4mI3G
         SG3Vm31tv384RRQDozrVXpq95enpzIvPqjp5scZ/uk7aj504V1wKn3xlbxBBEP/SUWce
         CGZA3zcbdUbVIEhM3GSpGTAw5HabAAZtUNz05sZ7QjGje5dBqZpsgBwUMNcsY+lyQfy4
         Rlng==
X-Forwarded-Encrypted: i=1; AKwUvBxZ9RCOqpOk+Wwav4F+/uqOAtv3ibg19rnvI0AMaeM3xNO6D0mhKSbIvGMMB93OLjVKR/0PWndc33z0Fjigog8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSxCQaQABfdIR6Nl9L5Uz9wK0XBkFYTYRqn7ROsIIsR6zKw5LI
	T+lO24lDFx6Knz/4kW0t056kSAghV0k3HEH4eyd/NMW4TuWJ2ZBPU+DSF5JfXXxcSmGtf9q0swI
	X0J93mQ==
X-Received: from plrp8.prod.google.com ([2002:a17:902:b088:b0:2e2:aae2:7762])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b43:b0:3a0:c276:1ec0
 with SMTP id 98e67ed59e1d1-3a4d1654d49mr2004241a91.28.1790792483132; Wed, 30
 Sep 2026 11:21:23 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:21:22 -0700
In-Reply-To: <20260929113711.2064390-2-leo.bras@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929113711.2064390-1-leo.bras@arm.com> <20260929113711.2064390-2-leo.bras@arm.com>
Message-ID: <ar1TItRR7o789i6_@google.com>
Subject: Re: [PATCH v1 1/3] KVM: selftests: memstress: Add option to enable
 dirty-ring on VM creation
From: Sean Christopherson <seanjc@google.com>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Marc Zyngier <maz@kernel.org>, Josh Hilke <jrhilke@google.com>, Oliver Upton <oupton@kernel.org>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Steffen Eiden <seiden@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Sep 29, 2026, Leonardo Bras wrote:
> Dirty-ring should be enabled after the VM is created, but before the
> creation of any cpu. To to so, add an option on memstress_create_vm() that
> takes dirty-ring size, and enables it at the correct moment.
> 
> This required a new function memstress_vm_create_with_vcpus() to be
> created based on the previously used __vm_create_with_vcpus();

Rather than pile on more params, if I ask really nicely, would you rework
memstress_create_vm() and friends APIs to take a "struct memstress_params"?
Except for dirty_log_page_splitting_test.c, all of the memstress tests already
use a struct, i.e. while tedious, it should be straightforward and won't put
undue burden on tests (which is why the core VM creation APIs don't take a struct
of params).

Then it will be easier to extend memstress in the future, and I suspect the
existing code will come out cleaner as well.  E.g. dirty_log_perf_test.c stores
nr_vcpus as a global, despite it being fully contained by main() => run_test(),
right alongside the test params...
