Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4D4A4402;
	Fri, 25 Sep 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344205; cv=none; b=P1V8BeJnSqL/ComMkZA9SC3q0LJQJWsWsG1EvKRL5GP3C5lWDJkx9MEmKx9q2WjuukbWGFLRolwZg8dLzkEa9DIeG8/uevR9q+RhqKTnVBrsDM8aOOjjgi3LjABqY0O19Xuf5neviNBQKeIVKt+hj9oLyVn1gA6DA25ITr77z6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344205; c=relaxed/simple;
	bh=6REYM8bz/NXTxTzlzUI6M7WzT/H5xMyJY3r/wEds26Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FukQWglp8AsHaTupBAWnx6p/nAiWmRL2M+WZDNFN3QU97XJUJXL7z6zTMopkFMGMII+2U7Wnix8sEXr1plAh7RKeaBs2VeDesJ9cyPCbs/iW1rc157T2DljsAJFEYAsL2Ws1lbuzkZLJTIGQd1TyGb+e25anu5vYJ7TFRHCcLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=MkRDQlli; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="MkRDQlli"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=Mx8vROKjEue4CqPaipfqL0nFb5QxpxaGF+94djZOesU=; b=MkRDQlli750r
	Yp3E374SWhYfqw1AWhWiFhFmDQbEFTFMmQdugJ9IUMyX7Dkh1wv57NdLRmBu4CGrFqPWewm+fL/Bv
	tDgHmrEVKPHhQLhCbGpwVFmpPJxg1iLFpwigsuPBI5lm5A5ifW/AetzMD2yPK+F/aoPSZA8KEx2Es
	KEKgxuOMdnylCRglvvScltW+H0/cMG6NeT8Lnusu7tneRW9Yap4t91qA7FBn7cLYBYfq+PzfYHjDm
	JU0GsPCucZS6G+rIj87aH5eBkmbpca1m6tdMfdgtL7WbAOKDa8bIPpTUyNZirUROd4LunCiVrq8m3
	w7J8lBFn9XIxjNCWkgHPew==;
Received: from ch-vpn.virtuozzo.com ([130.117.225.6] helo=LekKit-T14)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <eva.kurchatova@virtuozzo.com>)
	id 1xA6GP-008l92-2c;
	Fri, 25 Sep 2026 15:49:58 +0200
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: dma-buf: skip the huge page test without huge pages
Date: Fri, 25 Sep 2026 16:49:39 +0300
Message-ID: <20260925135000.3641709-1-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last udmabuf test backs a memfd with MFD_HUGETLB. Where no huge
pages are reserved the mapping fails and the whole test is reported as
a failure.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
---
 .../selftests/drivers/dma-buf/udmabuf.c       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index d78aec662586..d8402e0ec056 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -25,6 +25,21 @@
 
 static unsigned int page_size;
 
+static bool hugepages_available(void)
+{
+	unsigned long nr = 0;
+	FILE *f;
+
+	f = fopen("/proc/sys/vm/nr_hugepages", "r");
+	if (!f)
+		return false;
+	if (fscanf(f, "%lu", &nr) != 1)
+		nr = 0;
+	fclose(f);
+
+	return nr > 0;
+}
+
 static int create_memfd_with_seals(off64_t size, bool hpage)
 {
 	int memfd, ret;
@@ -234,6 +249,11 @@ int main(int argc, char *argv[])
 	close(memfd);
 
 	/* should work (migration of 2MB size huge pages)*/
+	if (!hugepages_available()) {
+		ksft_test_result_skip("%s: [SKIP,test-6] no huge pages\n", TEST_PREFIX);
+		close(devfd);
+		ksft_finished();
+	}
 	page_size = getpagesize() * 512; /* 2 MB */
 	size = MEMFD_SIZE * page_size;
 	memfd = create_memfd_with_seals(size, true);
-- 
2.55.0

