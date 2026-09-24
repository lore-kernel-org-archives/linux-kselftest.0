Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B04A4997
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266076; cv=none; b=R9neZW1oH+M02QSFwe1gLma8SQ99kBZjsxljx/7WWeejVpdWiLO7D86evAJi7r+tWo2PWDlesl/3Dw9Bu7M0fSEhJko+PImuPoQ9ZounsSKGJxLH3XueF3l5x321mafpFtKX7PezAlOapgh/mFUk5lMXkY6vB3zhI+oeYkHrwQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266076; c=relaxed/simple;
	bh=FTA1hplTwE6Tm/AWt8cHu0oNlw5249gED31A1Xs7JiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Na1qv4MelLdlkx6a3wndlY2SY3fNm25IjzQrOoOwD022kAr5ZfB+WqNJFOUTPvvLPTybpTD9ypYSF9a2wH6ZAQU4krEHLd58HjH9LL5dVM/nJLt3Tv3SmHdSn3v5g+EfYs3ElehXOONZ+oMgkyXCI7HrCpZY058ES/+uZBlLnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwWVD/ep; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwWVD/ep"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso17515761fa.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266072; x=1790870872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlJxRGZbP2ljvL1oHIJzjCOAGk0RJfd7Mzmzs0O27ho=;
        b=IwWVD/epET2GPaCk7VZde047Hnmfk8pE6XmPa+Ax6Md2EY7RZMbIFDX0Yl9PaZPB30
         YY759VtRdN6p1i/87A17zRBFV9lCN5HzUU48cChksdw+Ug06+u7G/oXt2N/AItO8TKoR
         ZfvQosC62Bd1G019pL+WRJoyFhwPdKZE48CAqkyR+aZl+qmx/X9DDPbOdCVPq91lHcNi
         KJBAuEPNm3wwvCgBvdA9vYgdicDvyCw4OHHEplawY8zOmk1S7K8jUHNiKslBTKEvVdQ1
         vgz4fgdRO3pUxsFp69EeEYcMYmyCKpSvB6UYZZWiMQ93V695QDbtnhnIQNCH0aORBT4D
         FROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266072; x=1790870872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlJxRGZbP2ljvL1oHIJzjCOAGk0RJfd7Mzmzs0O27ho=;
        b=FtRx9MrhwEJmq7yraxFdf57hSeFpeTePd6aw025PZA1ahNbbdR6I0C83vDAlfbsa9T
         9TnwYXeGx5JhIGP3Qj1RaHi7T8lYDG5d64jKLuVRZ1pYx7etSoawjzluQGmt894TkD4C
         l9qujsuoztOu0hk4Fc2yGyhhGzyfDC3ky7tXgmqrmeAMMuwZ9Cm9R1MhROQCEpMsHcvU
         5wj21auYtPvPWtkQEObNExoke4tEQgD8bmhfCHdvyLsds6H+YZv0VmG8c7uhbyoZ2BNm
         Oio35U8uExe42WZ4+TO43zKjM9iYL0lI2BDgY47wfS5rqbaoubKk9D70NnJIjXf9EXCt
         YZLg==
X-Forwarded-Encrypted: i=1; AKwUvBz2ye4cdcQpHJXYi7eYPxcCVKeK6R2vG5eksHlpglo7e+CT+ER8HsPykWIqcNZR/Ixb8cYnns7jiucwfP6g2oE=@vger.kernel.org
X-Gm-Message-State: AFuF++myelNnxIdDIsmIi6qjyvMcbXsly1Fd+Yo+m0RGtu0UedKhIvhm
	vKmvsgpsahdIGs99gXuSpmwaZghHNgk07nEUEGqIOLRStYbE5UdK9XFckU7lRp8ma19pXw==
X-Gm-Gg: AYBFou0rB2zcI+dnamYkUndRRVKrgEaaIBaGBzgBL+8m7CABxZ4QJRxqxUGvrrPXXSb
	7/AgWhYgB/CaMKdpMLDgn8OpotyUMQFnsYxBBDgVwHoTN0LIKjkLBAB7lv6G2rrNzqP9AOGVOe/
	ShTdPVOnrRHY9kuzeKkv+omBcdVszMKKcYBq5zBh4RjWkCW4ySHaBHxKZwnOWZffw1kIk50yK60
	OX61o7SRBSwYVIZjhca5p1MLSm/FnBlwqBtXrF74HivkO/9UV+OQI5Yv2quNXK8nL9ElWvjNbBB
	qA7l8NOoH4qeTVj/sautKsdXvaUx/9Hl7bTTKQc5hse2Lcjtv2UArTZiMBxPVn4f1t1+BybOHpC
	fVPp+GFe3MnUpiFltiixD/P9DijtGWqnkeydX2h4JSlZmd+BTT/XDH2xQBlqGgeAVXNnLrB4/nE
	0OTxPaQ/2AsuxxJUXaCqf6C91UtFuzu2TLPpZeOvq6aCnanpiVIO/8mocuSIr8wQt3oG02zAGw+
	Hi+rBvEpXstLbY=
X-Received: by 2002:a05:6512:1344:b0:5b7:6ff5:24fc with SMTP id 2adb3069b0e04-5b8df0d42b4mr924391e87.9.1790266072156;
        Thu, 24 Sep 2026 09:07:52 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.93])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552fd4sm1563292e87.2.2026.09.24.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:07:51 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: [PATCH bpf-next 0/2] bpftool: Don't report an empty map when key iteration fails
Date: Thu, 24 Sep 2026 19:07:18 +0300
Message-ID: <20260924160732.485650-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"bpftool map dump" stops at the first bpf_map_get_next_key() error and only
treats ENOENT as the end of the map. Any other error gives an empty dump
with no message, only a non-zero exit status. Local storage maps always
fail that way, so a socket storage map holding elements dumps as "[]".

Patch 1 reports the error like "bpftool map getnext" already does, with a
hint when the map type can't be iterated. Patch 2 adds a test_progs case.

The new test fails without patch 1 and passes with it; the other bpftool_*
selftests pass. Tested on x86_64 under a bpf-next kernel with KASAN and
lockdep, and through BPF CI (x86_64, aarch64, s390x).

Maxim Skokov (2):
  bpftool: Don't report an empty map when key iteration fails
  selftests/bpf: Check that bpftool reports a map it can't dump

 tools/bpf/bpftool/map.c                       | 11 ++-
 .../bpf/prog_tests/bpftool_map_dump.c         | 76 +++++++++++++++++++
 2 files changed, 85 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c


base-commit: 4f3a5eae895b9995e93425a75235d8f1f3268caa
-- 
2.47.3

