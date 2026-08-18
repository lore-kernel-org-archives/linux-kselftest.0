Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE63FD969;
	Tue, 18 Aug 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039690; cv=none; b=rbu5SUbX3Uvqf+Q3Ci5ekRtKfynEtl6Kz2ANO0oXG6so4xbpxiEdNPw7E6CzeCKwIW+xC5ea5SWcR5yMx3EPDpKFZULErnVmJSSrrDRr1POmJjAAr/YnfuIhV0qxAL1ev1GjTcygRwN/nYbNKoXmUL3/yMbjjMVqvB3I/+ong0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039690; c=relaxed/simple;
	bh=C6zDUlnOWXG88KZVNtH82Jq8g17rO1X+1YTpXl7mVj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uo5vuzU2r1dqsbTOw5WQ4GsnGU5dnDKBXcybCm4ZLaiJvUiwihg2ACDrHUWYQ1oG89qf4ZwXLb+/OyaZRbdVVCB59JQfZzemNh4wzCFFWnt7oAqW63aPDwm6XEPOgLh7yfk2V16qpah3lZnjcYihzMq3GTPj1aJ84tpoV9VCZM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O7MnSUK7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O7MnSUK7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H3DxFYaj4Aqc93V8Z78uxkKDWnCsWeLyjRd/Pa+Wi2A=; b=O7MnSUK7WpX+oTCPtcQ8P7gjrv
	9nwsaRqSmPi08NSY+M9Ug1orxP6eSNJL9I4AtIjxLwCxtgVQ6rwoM6NKezbLULB2n9rr92artY6k8
	dnLFGo3L9Fw5fYhWQPDZ8HQ/2ebTh+tZMt6I1Uesx4VCYy7+4ImZd4gy+OcN0H/0X0G/2jGwVyGQ9
	4E+wSRoch/4aeQy+lFkR4AfX51M4J+vLkPk+HVDSdwOvKjPwhQAg+Y7IVKX9WYbZPaweeWuJpbmJM
	xnVSUUFQTX9PspIry2SdzJn/DrGOyj2E+GJSfC88Lb93OUiMn1I7VxuabtqIWi962p8fxVCV2zdf2
	3b2WZxPw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wwEeX-00000001Rnz-1q1e;
	Tue, 18 Aug 2026 07:54:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 16FB9300244; Tue, 18 Aug 2026 09:54:32 +0200 (CEST)
Date: Tue, 18 Aug 2026 09:54:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	John Stultz <jstultz@google.com>
Subject: Re: [PATCH 0/1] kernel/locking: Add mutual exclusion self-test
Message-ID: <20260818075432.GA1247881@noisy.programming.kicks-ass.net>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817130239.343594-1-haakon.bugge@oracle.com>

On Mon, Aug 17, 2026 at 03:02:35PM +0200, Håkon Bugge wrote:
> Hi,
> 
> Please consider the following patch for the v7.3 merge window.

You are a few weeks too late for v7.3. At best I'll end up looking at
this after -rc1 at which point it could possibly make v7.4
