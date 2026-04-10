Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C2E1DE2D8
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 23:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775865315; cv=none; b=WYiJ/ypuDTii/m6KdfFnBQy+0AI7Cg4YawPs9SwgqZvP0KOtFMHde/Ojh5s4+J8y3oXvruRAf8LfgUNdIIGnofLpdfg9iAdnrO1r8LsWoAmJrDf+mvJsFSHadd+aZgDGloJ2hbZ2gXPUS6EFjHBGcBfWfljA9qzP/HvAnrRnHks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775865315; c=relaxed/simple;
	bh=/SpgJSi3FfahSnpM6wP+zDTbB2l+guFWU+fHrSbRUQw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aXNiGTrSvqkObsZjWAhMEpN4GnlFFmGIndifBbxks5aPqbvjiO2FM1xE8cmgm3RyvBpEJJlGwUeGoBznB4eXB+q3rPzTw2+TUk58lNXRsE9CtBA/PEriXFpMd3197jezSeI/pobEgWVhtW8thGo80Z8kaWrQkfd/YZirgoSqDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kqQ/2dE1; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kqQ/2dE1"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2d70f60aff7so756175eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775865313; x=1776470113; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IwiafJTgqkn1jL5W+x+zRyEtdA1uK1gYi7Sp5O2iBaU=;
        b=kqQ/2dE1iU2W8AietZpq2xWOkMYYjWNMQTAGYM9PWFqVwCghvt0sde8iS5hEgxiA0D
         jYmmm5SNQgIm22GEbNU/TbVLNcaFmaXFLgf8JX1blaCeSd/TNH45xeuDvTchDf1zs3xM
         GlHVID2cuyVixjME0V3zk9KRaBdmNeqkcE7BQKkDXk8CXrGRF2FlMDH3ysEYHI3rTyrY
         eUe23ClVihnbEQ/zGWrfjsQ4VMUK/3OgbjuUtLcYtjhy8bvSipBM+T6626EbpQV+BlcN
         VSls/R7NKMRoL3T8BIB9T8HDFfdyumJyyO7kLNjs85qtuJzRWnS9ese9TjcBuAtvXN6a
         YCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775865313; x=1776470113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwiafJTgqkn1jL5W+x+zRyEtdA1uK1gYi7Sp5O2iBaU=;
        b=Hfnqgw/46YJY19OGNDPHsCYQ0BbUnmiHqjgtmEDhb4ORBxqKnmK3e1AExonswSeBvs
         9x8PGzI9KXUaT8yckZBQVfHZHhfk5raOm5JmbPPfJGXDXYyNK0h390SQzQhvWZOL6ywE
         D/J9OzyipQ8xF+sAOf0f77lVJ4VwEDZHF1P1lQfqUGWRAa5tnGdhooueS3K6VOFaOFeY
         2YyEnf/CDHrbrquy/GVUOiMRq8FenZSsB96xQKUdia/3igavjwBRAKiQheVSDbuFIsFK
         iPYx3c4iq02p3c4FwF5sRv8TN5lMeMBvk5gASg30EZZk7yt2NBQ4mdpHOujTiZtFoZPa
         FErg==
X-Forwarded-Encrypted: i=1; AJvYcCWJpBU9OqBXEtLLeIb23wmBpbCBdK+T0DFOlebe+cDb02Cm86czyIEUdWG3JpCiRsNtrWPF4DNxJKIvtKpDk0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbajvQr48tJoP5CS8sjOuzKdxmsNnNyAJ7awyzuRb2VKm4Rcan
	z68uQ/F7Rhz2l0fyDzFpycobMiB3VP0/ah1sv6bSJAojHnpn4Rl3a1+Zv6qtY7/CJEH3ZXg1toh
	/WG/krqQCIpGdfP75q/B8uOTaJHm2IUxHaw==
X-Received: from dykp42.prod.google.com ([2002:a05:7300:caa:b0:2cb:a16b:ff43])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7495:b0:2ca:e4f2:31ff with SMTP id 5a478bee46e88-2d5873adf3emr3646512eec.6.1775865312896;
 Fri, 10 Apr 2026 16:55:12 -0700 (PDT)
Date: Fri, 10 Apr 2026 23:55:11 +0000
In-Reply-To: <20260410125655.GB3102624@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260410125655.GB3102624@noisy.programming.kicks-ass.net>
X-Mailer: git-send-email 2.54.0.rc0.605.g598a273b03-goog
Message-ID: <20260410235511.2989255-1-aniketgattani@google.com>
Subject: Re: [PATCH 1/2] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: peterz@infradead.org
Cc: aniketgattani@google.com, bsegall@google.com, joshdon@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mingo@redhat.com, paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 14:56:55 +0200, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Apr 09, 2026 at 09:22:22PM +0000, Aniket Gattani wrote:
> > +	if (cpu_id >= 0 && (cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id)))
> > +		return 0;
> 
> Did that want to be:
> 
> 	if ((unsigned)cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id))
> 
> ?

Thanks for the review.
Agreed. I will fix this in v2 and will wait a couple of business days for anyone else to respond.
