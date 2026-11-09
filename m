Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187395;
	b=CoqfTKCHKrCrfnu8FhLVdRCaYUMS5wTV3LR/A/SLcvBEHKkdtFyVGqH7RikMArq5ztj/
	 O2Whtwlo5s8Vt8royxmUJb5n9ZFKj/3au7q0KaUghSEEW8rWQRRoRwGAeimkrZRwU54PH
	 7DarWy4TlrXv7Q1OMlvZmuysUTs9grDTYvut5homQ2RxkB1Jd9f9stRvcVrzI9fS47a1F
	 6ENNk0/XiYgzw4wlksypNphaYEulB14zADtiGVK2z4gqOR3MdHiqWliKv7E1poZUIpjJv
	 LkK/kjFnpoP70QIcj8SmuJ+647twBGK1FUKSLegG5X+DYKxRLIyHK/VjA5WC91Va/Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Yd5+TdsEc/1kR6XeHOmWBxFOLTJkBLfiUyBjyyrqsyk=;
	b=MSEnOaQ/iIyxjYYKlmLJRb64+irFYXEkP/XE9boLGGuGu5GNMjjOQdx/FMNzHmbmIslt
	 kuaQpvYpW5wj8VIQUb6XBWXzzDUNXpU3AE1PPh5EDPN3skEMNLsIIkopwk6BA8e+zGnUP
	 W+3Xe0WpCauxvzlecc/WLMlQe8VLyOupAdZXyAtZ5cxL1/lOwG7lDG1y6g6AbAkab3JeU
	 6SRiECWEM2sBLb6kH5Es2VbLmJHDhyXlYHriRuhbw+laYxTYsHcYHZCcM53X/0+6GHh+z
	 0n8Utz9TI66xB5z15Wu39uPD1H4xVDT5MCPX/K3OEgfJV9Ux1TWud/0r8/hMYSmLuqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/YJbBzw";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C560A6F77
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 01:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2C560A6F77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/YJbBzw
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so636474c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187394; x=1794792194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yd5+TdsEc/1kR6XeHOmWBxFOLTJkBLfiUyBjyyrqsyk=;
        b=M/YJbBzwhR7G824BApq9UpMteqyazdlfLXmqEzjBWffbJOpvrxEn74LfEgTvdoSsFJ
         gwZjE5z6qzdfmHWGv7QjpYwKK/0SzJq7V9/MBlbN0vkwnfblCVV6pFLW9vMx+hFF3uGC
         nXQul+AIMV47VTE+XY1Nol0/2GfX3A0JaERyg3e5tx6u43JD0dv73IZnNCu+9+x3nfwp
         lM746MazS/FYhc6TZGdozxcewIFQVxpsXopAdT8zzrNQjEEsQy92MZayAA2QKJr7VkdF
         sg4TrVPYUqyaLU2UsCS83+nzJDBo5xZ0lQUA/wjxGwvZiMMnOLfsGiO5CBkaPnJOipTh
         brtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187394; x=1794792194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yd5+TdsEc/1kR6XeHOmWBxFOLTJkBLfiUyBjyyrqsyk=;
        b=PMWVJz0qatULbklRBfEOJC/dGqq26h//M+4CZumglNF/nwCHZF0UDj6LAUeQOLIiEM
         koQWwsb9wOeWtdhuF6yvExKdV5TZp9lonuQIGPzQdWAWDmiS+wbKWUXTyQpoIPuyQSv7
         vZa65e7TMEG4fdFx2WT1BK9M6qCR19+6DG0O089NamX6+flEpAp2D6E0virWgAzU+io1
         SCMiRpWjC5+gLzZBJJkTeWGRO5QE4gnuZycN8D2QDlilwpXLJhUmoF2YpWLI5awzurXh
         Mgc0LMCspPANGjACD5Rx9mMzcB9cWbeVda37SlLWLwohpqITKTEk/NGVzks5iDRtZce1
         SHrA==
X-Forwarded-Encrypted: i=1; AL+hErG2xh6z+LVhQ3VbZiRPqS8viUXB4V2PQ5EmVZl3/cOGuFiN97YVH+iWlgKALeIHttSs6zR+lPiuxbYRHgFjRCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kecDVZT0BncvLoo7C2AzWbHCcoRjz0R3dBETQ7TiVEDEE1Bwv
	PN3xJ+4JMSUGTzlasmSZy/WPELKuVnS44f2v397FxATRAWgN+M/YxTaY
X-Gm-Gg: AYBFou0CxElmBOPz9Vkt3BY3gJOXIry0uwibUex7cTkbsKq3wbIJ2Vd4EodYY2PR/wB
	4EiLmSYUojqgweOZnvypQiP0vMEMzg1X3bwyd6A4xnsnFbe0UZZArF4tW7ddroJDcAuEb88Ccoh
	edrLAQiaN2hl+bsR7KeUQshzug7Vf2JC/UZXE0t147l990QbipJyMLkrc8h3c0FulSY9iAlnobg
	5TxfJk8/K1wcoluIEhfvcujRxGFA2GEgKer/BGZNTjxEWdzZgZvL/VCBTNk0kry5KKyRaCZM+IF
	T97B5W+XhSh0SmU9vkt5HnRDHX8WWh7c6KMyx2+JoehL//W0ngbNZHtD8oaRudoqo+XgU5Fu3F4
	mHrMkMVqqhRD9+eFp45+grDd9h4zFjak+KZxXOXS3RCMGlybmtK1Hvkk7O+8neGFMZ4RU1gA1Qu
	uQsLvuk2k+FRfWeKxq9UMKaKpNWvHrZ3zfMtTpwy4W5YYgBQVWc4b4/qgX0OmcJPrvOJRX+sxDy
	prkOTtHu5wZQi7AUlzbrCcUdT5RpHcgfVR9MmxZe4uAU+5VSuZ8eXYYrU/Fg3eSG/5fn2ALhs7M
	av0HrVR/lvLkbQuFqTgK2sY3
X-Received: by 2002:a05:701b:420f:10b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b39ff1d2famr4082012c88.45.1794187393835;
        Sun, 08 Nov 2026 17:23:13 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:13 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:52 -0500
Subject: [PATCH v4 3/5] selftests/mm: fail KSM helpers on short reads and
 writes
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-3-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The KSM helpers in vm_util read and write KSM's sysfs and procfs files
with a single pread() or write(), and return -errno when the call does
not transfer what they asked for.

A read of zero bytes or a short write leaves errno at 0, so the helpers
then return 0, which their callers take as a value of 0 or as a write
that took effect. A short write of run makes ksm_start() wait for scans
of a ksmd that never started, a short read of full_scans makes it wait
for scans that never seem to complete, and short reads of
ksm_merging_pages or ksm_stat and a short write of use_zero_pages make
cases fail that should have been skipped.

Return -errno only when the call fails, and -EIO when it transfers less
than asked, so that callers skip or fail as they do on other errors.
Forcing each short read or write with an LD_PRELOAD shim on
ksm_functional_tests:

  short read or write of   before                    after
  run                      cases fail, then hangs    all skipped
  full_scans               hangs in the first case   all skipped
  ksm_merging_pages        9 of 11 cases fail        all skipped
  ksm_stat                 zero page case fails      zero page case skipped
  use_zero_pages           zero page case fails      zero page case skipped

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
The checks come from 93fb70aa5904 ("selftests/vm: add KSM unmerge
tests"), 3d0745e59c84 ("selftest: add a testcase of ksm zero pages")
and 42096aa24b82 ("selftest/mm: ksm_functional_tests: test in
mmap_and_merge_range() if anything got merged"), and b27f292de6b1
("selftests/mm: put general ksm operation into vm_util") turned the
use_zero_pages check into one of them. There are no Fixes tags, as
only short reads and writes forced with the shim hit them, and the
helpers are in vm_util only since v6.18.
---
 tools/testing/selftests/mm/vm_util.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 515031b8283da..caea045fa7d46 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -920,6 +920,8 @@ long ksm_get_self_zero_pages(void)
 	close(proc_self_ksm_stat_fd);
 	if (read_size < 0)
 		return -errno;
+	if (!read_size)
+		return -EIO;
 
 	buf[read_size] = 0;
 
@@ -944,8 +946,10 @@ long ksm_get_self_merging_pages(void)
 
 	ret = pread(proc_self_ksm_merging_pages_fd, buf, sizeof(buf) - 1, 0);
 	close(proc_self_ksm_merging_pages_fd);
-	if (ret <= 0)
+	if (ret < 0)
 		return -errno;
+	if (!ret)
+		return -EIO;
 	buf[ret] = 0;
 
 	return strtol(buf, NULL, 10);
@@ -963,8 +967,10 @@ long ksm_get_full_scans(void)
 
 	ret = pread(ksm_full_scans_fd, buf, sizeof(buf) - 1, 0);
 	close(ksm_full_scans_fd);
-	if (ret <= 0)
+	if (ret < 0)
 		return -errno;
+	if (!ret)
+		return -EIO;
 	buf[ret] = 0;
 
 	return strtol(buf, NULL, 10);
@@ -981,7 +987,9 @@ int ksm_use_zero_pages(void)
 
 	ret = write(ksm_use_zero_pages_fd, "1", 1);
 	close(ksm_use_zero_pages_fd);
-	return ret == 1 ? 0 : -errno;
+	if (ret < 0)
+		return -errno;
+	return ret == 1 ? 0 : -EIO;
 }
 
 int ksm_start(void)
@@ -1002,8 +1010,10 @@ int ksm_start(void)
 	}
 	ret = write(ksm_fd, "1", 1);
 	close(ksm_fd);
-	if (ret != 1)
+	if (ret < 0)
 		return -errno;
+	if (ret != 1)
+		return -EIO;
 	do {
 		end_scans = ksm_get_full_scans();
 		if (end_scans < 0)
@@ -1024,7 +1034,9 @@ int ksm_stop(void)
 
 	ret = write(ksm_fd, "2", 1);
 	close(ksm_fd);
-	return ret == 1 ? 0 : -errno;
+	if (ret < 0)
+		return -errno;
+	return ret == 1 ? 0 : -EIO;
 }
 
 int get_hardware_corrupted_size(unsigned long *val)

-- 
2.43.0

