Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A740DFC1
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 00:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777507926; cv=none; b=Efwr6wAw651RXr7/4AoXyMECfVgkLxGKScJ0qwjDbkBRrkLjkK/BJOLLaw0qE43wNdaRa24Luif1gCwcKLR2JWpXsbj0wQeO2VNPTun9vPu5e1tYe5GwePfcUsIVnLS+H60Bzf8opCsBLzAKcDcvDUolgiWEtPh1uEzoqWYNwwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777507926; c=relaxed/simple;
	bh=6sYgDNOD1AaqOKJSgBvMJ2naf4FVahhxWL34k9U9ED8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WAoM+GsJi3MR3bBHpUGdVImfYg8HuNJYhXZ0SznEsClVXQTozPT6s6eYQT3/9EiCE6J/nmD9EuD0UvVfcW3crTW16qqUQ3VmEqshmtcK1WqiTMWFYBA3v7O/FtEMsnVY8Ak8w3gN9nKDwLv3KqEz7IScJUcgEMnyJfICv4UEGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TgEgCJcm; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TgEgCJcm"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2eaf70f3b5fso479028eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 17:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777507925; x=1778112725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dl40BgfsKMv4JKZvVJi9z2VoboTFCJMd6Rmp4zsqo8s=;
        b=TgEgCJcmGTF3HWLJ8AetZg0/o7VGT88oGd7ozsawJDoEAfdU68x9zeC1vwDcilPtau
         k7v5v+Uw0uDnGqiX61DvBySq6QmSd12a50sl2g8MIKdFOy7bZ5sYr8AyxseQJPsAAgiR
         XYuIrdNgHnnxk0cK6Ppjq7dzP3tOvnBD1to0wZopbrRt1l/yaajYjH4vVoouyvJsky63
         5AEBxlZsEovq59l3J2rPK7ee7M7Hcp41uqxHhtJIMPivvCjvwEKO1cQvpVXrlNNmPjIr
         UAT9l9p1Uj1DMt0UfeCsljCKOZrDf8ArDjP70K6iCj4L1iVzvR1pM9324EK3E3R77J8D
         NkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777507925; x=1778112725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dl40BgfsKMv4JKZvVJi9z2VoboTFCJMd6Rmp4zsqo8s=;
        b=POZypljR8I7cHzg4fJEoCk+jNzH+z9q88RjsknoHp3t6dYJS8KZlU3qqwj2AeabqkP
         IPECLQkjLIB1BNvrakHTRugW1SnVF0HhiptbtSE+lelBlmzZyDe742Ey6OvVtr2UbuHR
         Q6MolWwpX/FRcIR9smyf4ZFZPksk4tOYzL6yofobnT1y5HI6WQ63DzHRRzF6Mb7FbhS+
         nulUwYQLzws5sqlNjml4rQWYMQFZL+sP/36nQmZDDz+oJPTgZ5fVCTQ/Qq4Zla1mDwvc
         cq1VpBnXJsnh9a58VYHAZja+2mVqn2J6w5NX4bMe3G7pig5Qo159xNg/f9YMvIJLhhKH
         VWzw==
X-Forwarded-Encrypted: i=1; AFNElJ/BqQMBi9fqbc2PP6GEjAJpL2tdnuyYGu5bSWouzj1tiB2r1KsXW4nBRlnBjFxNGCMlutBRTAXVmCAGHD43UrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy000y/RhuOyXrz05vVLfRkKXsDl29uhGfz5FVapAbUq8NdPFU
	0hPmYx5HkBX4MWsjnlVAeGivGk72iv9xmzx3Y14o+vsHpPbVSfSwzuGC2w9tFnuoqgle3pQv6XQ
	xhhBxYEzlR1+2ZorwAA60mXDXN3cHFYBXjg==
X-Received: from dycaa19.prod.google.com ([2002:a05:7301:5413:b0:2da:b59f:1e95])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:e8d:b0:2ed:e14:7f5e with SMTP id 5a478bee46e88-2ed3f15aed3mr195367eec.34.1777507924508;
 Wed, 29 Apr 2026 17:12:04 -0700 (PDT)
Date: Thu, 30 Apr 2026 00:12:03 +0000
In-Reply-To: <20260428124823.GY3102624@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428124823.GY3102624@noisy.programming.kicks-ass.net>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430001203.1408218-1-aniketgattani@google.com>
Subject: Re: [PATCH v2 1/2] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>, Ben Segall <bsegall@google.com>, 
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 28, 2026 at 2:48 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > + if ((unsigned int)cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id))
> > + return 0;
> 
> Right, so this is broken, sorry about that. This makes the whole
> cpu_id == -1 branch below dead code, and that cannot be right.

Hi Peter,

Yikes! Thanks for catching that! I forgot that I placed the condition that way in the first place for the exact same reason.
I should have caught it myself.

I like your suggestion too and will incorporate it in v3.

Thanks,
Aniket
