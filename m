Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420536F419;
	Mon,  2 Mar 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440934; cv=none; b=ZGwJMgIojz2U0CJCUAysax/fr1wzb7ki/+gZlw7BGg6qWShVZ+FgQdBuxlNwyyyStTL2fRx3dtYW57hjuJBSvAJ8OrMFZwrvor6cwNgfehA/7F8/bSGDNzKaJ1sfAA83OFkBYde6vB6Iw6Fvmn7DSTqbJ7GXaJmNqtS/hg1QTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440934; c=relaxed/simple;
	bh=XNDHSVTvi/WAt76uQOF0YQlS9WIsMW93F5cBJXb/2u8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ISJQytZnMPKPoAxvVBccG6z4RhjkQ5DcGH5KwN4NqT+lT1ubv71chKOq+SmKNT53Rq2j7rtI57FBrXVsio8dvIbrq8OcZ2r1xNmJl+DNwoA+8g0HsWGrfGhUXJKbCcX+hhbmJegppwPIWDfpwuXuv7YQ6glSwP++3tEqZh+xlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=p5X2v/88; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="p5X2v/88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9p
	548e6YmUOQuJyRYUEtWDgWaEFFDD/mRin2y02LDKU=; b=p5X2v/889BRlkygVNZ
	KuYv8KyIfzCW+p3CuMM2mV4m78e9959NJCIe6raBW5L3gdkGMrF9c8iBPwpWbQAp
	pA6EK7zeybqHOzjrH3iLtAm0xX8o80MX+GBMgHWSBY82LhON4XrgVP8lAw35CODw
	37n9qXIdrvQHfCYS2eMhzl+jA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wC3xtM7TaVpTZohOQ--.7471S2;
	Mon, 02 Mar 2026 16:41:32 +0800 (CST)
From: Feng Yang <yangfeng59949@163.com>
To: arighi@nvidia.com
Cc: changwoo@igalia.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sched-ext@lists.linux.dev,
	shuah@kernel.org,
	tj@kernel.org,
	void@manifault.com,
	yangfeng59949@163.com
Subject: Re: [PATCH] selftests/sched_ext: Fix the incorrect logic validation
Date: Mon,  2 Mar 2026 16:41:30 +0800
Message-Id: <20260302084130.480694-1-yangfeng59949@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aaVAhdw3ZO5kHJ32@gpd4>
References: <aaVAhdw3ZO5kHJ32@gpd4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3xtM7TaVpTZohOQ--.7471S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1ftr48Xw15WFWkAFWrKrg_yoW8tF4xpa
	4kWa9IkF1DtF17K39FyrWqqrWrWFsIyF4xWw4Uta13AF1kWryxXr1xKr1Ygr9xur1IyF4f
	ZF1Ig3yxWa1xAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUTv3UUUUUU=
X-CM-SenderInfo: p1dqww5hqjkmqzuzqiywtou0bp/xtbC8h0mnmmlTT3sdQAA3y

On Mon, 2 Mar 2026 08:47:17 +0100, Andrea Righi wrote:
> On Mon, Mar 02, 2026 at 02:48:51PM +0800, Feng Yang wrote:
> > From: Feng Yang <yangfeng@kylinos.cn>
> > 
> > When __COMPAT_scx_bpf_pick_idle_cpu_node selects an idle CPU,
> > it reports that the CPU should be marked as busy.
> > 
> > Fixes: 5ae5161820e5 ("selftests/sched_ext: Add NUMA-aware scheduler test")
> > Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> > ---
> >  tools/testing/selftests/sched_ext/numa.bpf.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/sched_ext/numa.bpf.c b/tools/testing/selftests/sched_ext/numa.bpf.c
> > index a79d86ed54a1..98423628b05c 100644
> > --- a/tools/testing/selftests/sched_ext/numa.bpf.c
> > +++ b/tools/testing/selftests/sched_ext/numa.bpf.c
> > @@ -44,12 +44,12 @@ s32 BPF_STRUCT_OPS(numa_select_cpu,
> >  	 */
> >  	cpu = __COMPAT_scx_bpf_pick_idle_cpu_node(p->cpus_ptr, node,
> >  					__COMPAT_SCX_PICK_IDLE_IN_NODE);
> > -	if (cpu < 0)
> > +	if (cpu < 0) {
> >  		cpu = __COMPAT_scx_bpf_pick_any_cpu_node(p->cpus_ptr, node,
> >  						__COMPAT_SCX_PICK_IDLE_IN_NODE);
> > -
> > -	if (is_cpu_idle(cpu, node))
> > -		scx_bpf_error("CPU %d should be marked as busy", cpu);
> > +		if (is_cpu_idle(cpu, node))
> > +			scx_bpf_error("CPU %d should be marked as busy", cpu);
> > +	}
> 
> No, this is not correct. The CPU returned by scx_bpf_pick_idle_cpu_node()
> should be marked as busy at this point (bit is set in the idle cpumask),
> essentially it has been reserved/allocated by the caller.

Okay, I misunderstood.
The CI test of this patch (https://patchwork.kernel.org/project/netdevbpf/list/?series=1058866&state=*) 
resulted in the error "CPU 0 should be marked as busy"(https://github.com/kernel-patches/bpf/actions/runs/22548310848/job/65314767856),
but I don't see the connection between them that would cause this error. Could you explain why this happens?

Thanks,
Feng

> Maybe we can add a comment if we think it's not clear enough, but the
> original code looks correct.
> 
> >  
> >  	if (__COMPAT_scx_bpf_cpu_node(cpu) != node)
> >  		scx_bpf_error("CPU %d should be in node %d", cpu, node);
> > -- 
> > 2.43.0
> > 
> 
> Thanks,
> -Andrea

