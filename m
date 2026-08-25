Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47B233149;
	Tue, 25 Aug 2026 16:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676531; cv=none; b=C4pV8AIpzTQm9tpTguDBQsQYjxmkcJ211JCRW0FIZGvD8SuG7C6VAo8xvyfvmkerXNMqiVBbkSH68kyguYq9liZ3XczdcnqarQ95IksnG2NbVtnlqYhA2VRCezT9N3cUI/ydPxXzC3BMX74WfEnHweIxx9T5YhmThrYv6bqXXf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676531; c=relaxed/simple;
	bh=w0Nz534msbVST4PGWe0bcici7O8SdWwNW1aKH1PEvo8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zi5nxIYXYR2geoWb2cYFOxTN7WJQna8khq2OPzVYOp5+NKOsS1wJcJu2WzLiyiYvOzemEbtE4simZZyBAIaimnJpDeWF3w60olmN2GogfNuyz51tm3XZ8igdCZsMBUiH2mDqxQMgLcSOH8UjLlGOnwy8nqnISg30hA9u5EJYGl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=II8AwypW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="II8AwypW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54511F000E9;
	Tue, 25 Aug 2026 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676530;
	bh=w0Nz534msbVST4PGWe0bcici7O8SdWwNW1aKH1PEvo8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=II8AwypWJ8J5PktAKnIUIL5AQOwNft0nNjf3gspAY727giNspS5FZeJaq/Psgbs7f
	 l60EYiY7JoP9gV7EQ8kikw9MtTn+HPP1+v7GARBLRo7TjrDOzTHvOhv/DUhvAVO9gp
	 KXbEvUSKY+pABhnckxFn/xbQCdQ34LgZuW9ytnTGZ1dmwwV+vov+W47lOanZ1qkZuH
	 C6fg2CGcWMCkL2NmxP8IqKbBLLDYWBCAEHusTDCvgGHI0SvFOG+PQgpxSCAsLTHJDi
	 J11xZL/TwjnT9lvJLF4KDM/OcUn5QYBZnsEWpb+i3O7inl2vbQZLPfXKi2bamOnqxP
	 4905Vy5I4OLzg==
From: Thomas Gleixner <tglx@kernel.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 mingo@redhat.com, shuah@kernel.org, shakeel.butt@linux.dev,
 hannes@cmpxchg.org, riel@surriel.com, kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <878q5zipcx.ffs@fw13>
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13> <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
 <87y0e8lmih.ffs@fw13> <87v79clmfu.ffs@fw13>
 <aocn4kp5F_2Y2e5O@shell.ilvokhin.com> <878q5zipcx.ffs@fw13>
Date: Tue, 25 Aug 2026 18:48:47 +0200
Message-ID: <87tsoign80.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 21 2026 at 15:18, Thomas Gleixner wrote:
> On Thu, Aug 20 2026 at 16:14, Dmitry Ilvokhin wrote:
> There is no magic cure for this with the current implementations and I
> doubt that any benchmark will give a satisfying answer which is
> generally useful accross a wider range of application scenarios.
>
> This needs quite some thought and investigations to get right.

I looked a bit deeper into it. When the number of contenders is big
enough to cause a massive cache line bouncing issue on the futex
variable then the lock contention on hb lock helps to prevent it from
becoming worse. It basically ensures that enough waiters are stuck in
the kernel that the rest of the threads can make progress, even if they
right away after acquiring the hash bucket lock.

Works by chance but certainly not by design :)


