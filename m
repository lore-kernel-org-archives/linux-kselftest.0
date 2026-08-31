Received: from mta0.migadu.com (out-234.mta0.migadu.com [91.218.175.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38CC30D41C
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151973; cv=none; b=Xc1x3DyHPdEk4/fdxnJ07v9wy1yPJwmLEwbWK8uwTZN18hA/6KVd6tJ+N+6uPffimZ2zinD42I8V16qqc5vnuCl4foxpqAL80ENaZWCUqP3d02+w9UVmAS434UOKHnC1Zz86EV1HdPJdMmfoS5H9bR51M/dYgyJR1nU/7n2UOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151973; c=relaxed/simple;
	bh=bmzSrjJaq3XT8jBEdtgSjOSepJY+gkPVCqgxYOBVBd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvFBonOTYFOMG23vZqm2v6g1lIRM+66Crte4UqQFJHCnIzK5+LMi3V3++wVsy6jTtfEY19koQqPpfw2Zc5EFxdEsPsO7DOCt2sgZqOSmHWTT77SosSSQCntPgxet0RP2YKIH2+Yi5zLewCi/SVcWs2b6LVaHHZXKSL73WbUNq/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LXdcyDXe; arc=none smtp.client-ip=91.218.175.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LXdcyDXe"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bmzSrjJaq3XT8jBEdtgSjOSepJY+gkPVCqgxYOBVBd8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788151969; v=1; x=1788756769;
 b=LXdcyDXejfPMX70dfSa96dlNTo5Zv0aHZXPDjeQm1a+mkQZbnbpGYe7ORNXA/PxsMYf8wmAW
 jgAZauaMJgvBG9nYO4SwEqmo25S/slmDixxJqJjtPv6NtXGD/EaoaUQsDxMLco7zEDuF6lkfaQe
 klSFlqqw9/O0Vdp6I537CxeM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1c9dc12ac8dfd3e8;
	Mon, 31 Aug 2026 04:52:49 +0000
X-Mizu-Trace-ID: 1c9dc12ac8dfd3e8
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: sarthak.sharma@arm.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	leon@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	usama.anjum@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/6] selftests/mm: make file helpers return errors
Date: Mon, 31 Aug 2026 12:52:41 +0800
Message-Id: <20260831045241.25826-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260831042101.18085-2-sarthak.sharma@arm.com>
References: <20260831042101.18085-2-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Aug 31, 2026 at 09:50:56AM +0530, Sarthak Sharma wrote:
[...]
>diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
>index 9a49af88702e..62f6f5b42649 100644
>--- a/tools/testing/selftests/mm/vm_util.h
>+++ b/tools/testing/selftests/mm/vm_util.h
>@@ -166,11 +166,11 @@ int unpoison_memory(unsigned long pfn);
> #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
> #define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
> 
>-void write_file(const char *path, const char *buf, size_t buflen);
>+int write_file(const char *path, const char *buf, size_t buflen);
> int read_file(const char *path, char *buf, size_t buflen);
>-unsigned long read_num(const char *path);
>-void write_num(const char *path, unsigned long num);
>-void write_num_ignore_einval(const char *path, unsigned long num);
>+int read_num(const char *path, unsigned long *num);
>+int write_num(const char *path, unsigned long num);
>+int write_num_ignore_einval(const char *path, unsigned long num);

Ouch ...

Looks like this conversion misses hugetlb-soft-offline.c ...

TEST_GEN_FILES += hugetlb-soft-offline

int main(int argc, char **argv)
{
...
	orig_enable_soft_offline = read_num(ENABLE_SOFT_OFFLINE_PATH);
...
}

And the compiler isn't happy:

tools/testing/selftests/mm/hugetlb-soft-offline.c:199:36:
error: too few arguments to function 'read_num'
  199 |  orig_enable_soft_offline = read_num(ENABLE_SOFT_OFFLINE_PATH);
tools/lib/mm/file_utils.h:9:5: note: declared here
    9 | int read_num(const char *path, unsigned long *num);

Cheers, Lance

[...]
