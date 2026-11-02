Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622738;
	b=TeMx9Q3M7UPAEzxOQMghNfno8yCq+sDkYkr9UHW30GZoEJMWXO98AdHbKgmIfvGSNdF8
	 Vm3qqA3LGNhK7B1qLQ4r8Y2qcc/SuUjLZlR7u1m2qjMH/tX49dsuqQds0+T+4/C/GjwKa
	 rxPIH+XA4Jxc+fU99Rsp1d1dd+Cg81khF9Ovni3EVmPilk60yyhpsnycKJvWbGMpshs/g
	 FP/T5/h17lU9TI9L4ewPcTwEpRQ3J+WX7P5bHKBZgLWEh368OtFM2XaKa5IA11J32SuCg
	 wBz0YYKJ69LgxN+Ol+to4qz0zhYtu47jqxP9vBuPOJzOEdpjawAVOa+wPn6vDccHudA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=lfTEZtUhCcU2T3URSEVjIEX2SBlCGYIkFNQ2td3t68s=;
	b=bjAmhyWBBDy1l2yWbvNSy4WcDKeZdTPaWVY7xSwUkcxH6WVDvrTYvNd+BFByJypaQ/BK
	 8X/YdYTbLI3jLwjyzXTXnfo5ib9TR88CT4E1+XNHQW/lgDnDYAc9m/9aIMldaygozA5qX
	 Ync5AFkpw31aewvhEyi17gJvUuzi9gxPgxYo4Xwre1Wr+FQUL9MTW1ag5iwfAX1E1IT74
	 1AUdQXaHO5OQ0GW+JDYxA1l3PfRx+yUl2qXx2qDDCo/PLI+pkkOzkrGeoFnSG+/Fmpp5G
	 5m62AACiBr1VVa9Rg4pYKiYA2THUFB39Q6Z1D/WFrwTtkeSIeQUNznRUcA52xoeWnsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IXPnlnEf;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84FD606A329
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84FD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IXPnlnEf
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1931ff67a29so5386704c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 04:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622737; x=1794227537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lfTEZtUhCcU2T3URSEVjIEX2SBlCGYIkFNQ2td3t68s=;
        b=IXPnlnEf1jbwltyqwb/bMrMK51l6iyIhrrQ2fg5JpDukS+CGDClt7341hvbF5LgmoZ
         lDtIXS3hLWs85Dg+lsrWh8miuMxZNQQS1X33IKqRQzG+Iqc1uUlLHJfRn+NEnpfpOkZh
         pjjn/y8s7Jpgswe6EtcawE0iWbKlupkm3mD8iMTbGCNacQe6IvFvCIbyofBbMJ0gvNvh
         KD4xEXocV+m8rLK23MliT6D3sXPLe4KKybWp0FW9gJaSHwAMf0StDJ/ZmLIoDg9ELzzr
         JF8VGiBv5TGe9DFbIpvL60shkoXNgSBo0XqF9V2ABii8GCzN9u3Y9xw/QuF0KJb/Ez93
         y4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622737; x=1794227537;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lfTEZtUhCcU2T3URSEVjIEX2SBlCGYIkFNQ2td3t68s=;
        b=s5aLOAN9y/asZ+OjEuKQjj6dcD7dgy41iWw3zMnsbiIT6sUNwQ663ko4Hz9oi9JHO0
         Q5u0zQO/1No6mwbKDKwJLHHKGWPdTi30J+rHAhm5eBCmXqw7Z8AVEBQXczQAHlqGBi8R
         09vs6A+A33MksuBPQxGIx2R6S1JrPujaHH4skqKDokIICI6b9xJx0Or5Sv5hIEv9ri+F
         VVrcQExzysmYufa6EHQcIDclmYlqrCsA1lQSoDbip8B6h7Y2EL3ylTzP8HHSGEa5imZk
         5BfClsp/tHIKog0jfKFtIP8Q3KpXJ9d7aZiSCgF/HEUjIaiwgcgFM2s253y6J98ybrc2
         oRzg==
X-Forwarded-Encrypted: i=1; AKwUvBzb9+Z45DN2ZM6Yw7WS0Soyr9GshzF871jE6f539gJq/ySlgZFwF2j2M5/eiIfYW/ITcqPjxeZC6U9ypnsneWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqqdtXdd0PkwvFTlwiPu3jxN64gXWtY7FD49pBRMGOCfTxLG+e
	pKOfSgUpGTuu0CUbQi7tF+c7r4syiPhaI5LCOybO6YyuC5QJLyyJKaHD
X-Gm-Gg: AYBFou0Wo9QtPVR3LRIWjcZyx+8dn2W2Xjov9DoWjuyWMFVcd8xvMu9TfB+DmBG1ndx
	pb70me4Y6ORo5e09mgD47W88ziqH4ucy2T679krUvhiYI6/kEjZDQ/vCXJTa/L1zo4N8O03XyBA
	IKN3BSjpESLOE8ZUFW0YXgNGGzmicjJD88O0qmSmYmdHwYHSuPbt6AvquDQTppIvi3yoxwPTTNH
	oUYDr2F84/RHochfwxpCsLzm+0nzMTIUpYXl+ah0q4PDs+OG7FeAiDBMZUjr+uBQxtwAtt8SuCe
	LcAkDpJPjFVhWUBbUU180I6N4o5bpqLOYUiiaMRF6iEw+iaLbYjJ0DZ90GMutd1xZxiTp9d14Vz
	QuWs1W4MxBU8xs371rKRcF3hL9gPZ9nxCQ5Fi7mjRAGzeKWhG1cjh1Sx2dlF3WG95adkpwurv5F
	5ekLZiLZ6yXecDvnx6E4hb4btd59lqD2gqCa1Ob6uu2ccsHueSl8qFzSopwfrNiRwiqfNrVO5Br
	E0x3KgO73Zxe0GKEyHE81I/qbZ+vuqytb3A2y6MMYlxAascv6RsTs7xUOYcxTU/JLL3goD+SAb7
	XMF6TAjS+U27xjkCBApxjYt1
X-Received: by 2002:a05:7022:eb50:10b0:14d:baf5:c415 with SMTP id a92af1059eb24-1ac5a0b4324mr16360361c88.7.1793622736733;
        Mon, 02 Nov 2026 04:32:16 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b2360d2066sm4950951c88.11.2026.11.02.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:32:16 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next 0/4] bpf: Follow up on the patch list
Date: Mon, 02 Nov 2026 07:32:10 -0500
Message-Id: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAMqC6GoC/x3MTQqDMBBA4avIrDuQHwjVq5QubJzUgZCETGoF8
 e6mXb7F9w4QqkwC03BApY2Fc+qhbwP4dU5vQl56g1HGaa0MvkrAMje/YmRpGHKM+fspguScvSu
 r/KgtdF4qBd7/6wf8VKK9wfM8LySpHKB0AAAA
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Alexei listed what the patch list series [1] still needed when he
applied it [2]. This series covers items 1, 2, 3 and 5 of that list:

  item  problem                                           patch
  1     the tests break with bpf_jit_harden at 2          2
  2     the out-of-range test ignores the insn number     3
  3     the comments on the aux data rules are gone       1
  5     no test has a second patch with a jump            4

Item 4 is about a commit log that is already in the tree. Items 10-12,
bugs that were there before the series, come as separate fixes.

With net.core.bpf_jit_harden at 0 and at 2 before the run,
verifier_patch_list and patch_list pass and leave the sysctl as it
was. Without patch 2 and with the sysctl at 2, 8 verifier_patch_list
tests and patch_list/line_and_func_info fail. test_verifier and
test_progs show no new failures.

[1] https://lore.kernel.org/r/20261102012940.1756142-1-alexei.starovoitov@gmail.com
[2] https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (4):
      bpf: Document the aux data rules of patched instructions
      selftests/bpf: Run the patch list tests with bpf_jit_harden off
      selftests/bpf: Match the insn number of the out-of-range message
      selftests/bpf: Cover a second patch with a jump behind a barrier

 kernel/bpf/fixups.c                                | 18 +++++++++-
 .../testing/selftests/bpf/prog_tests/patch_list.c  | 10 +++++-
 tools/testing/selftests/bpf/prog_tests/verifier.c  | 17 +++++++--
 .../selftests/bpf/progs/verifier_patch_list.c      | 41 +++++++++++++++++++++-
 4 files changed, 81 insertions(+), 5 deletions(-)
---
base-commit: cd5bc55288d4fd999595c8f2af6a5408cbe92a52
change-id: 20261102-bpf-patch-list-followups-e6638030c913

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

