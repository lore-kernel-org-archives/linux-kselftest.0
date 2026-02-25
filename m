Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409782BE642
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011639; cv=none; b=cIIUByLIwhwl+uv1e7iziJcFgQCO8911F8TSw/H1w6RQogRRgnKCOJkEkCZQSN9QHXGyZjtT/F50qUTlG7mWrnon8wDHzJp9DMlLBkdhsTa0aaUvwIjpCgoESg5OoWYtxWdVqPSh4XHdjmHoiUYICMSLKqok5HEc1xAJgZa+r4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011639; c=relaxed/simple;
	bh=DSh9cmYcoDq6RSZ2gJWFd5OqBgP4RP8EBSvvqxMW3uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iF6IQMf/cjzZ8grybDh+ayDl5ywo3dMXqYcbMAnewQCFuEBbJudJigfYsgUg3UyhpYtwWn5BAckHZGFOR7D+Oh5Ezmp0TnNZnFq/7pyZxEulIPmd41HnGA62L4E7Sdhr6041QLlaTJY5cxSu2EYDm13U1rKUchh8dxn3fyQeQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gk1tpvoK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gk1tpvoK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso900041a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 01:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772011638; x=1772616438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xce9lXDzX6z1O07ZSxBwTpQMJv4vT6Yu3vRs6kQbfoQ=;
        b=Gk1tpvoKR6WEnHFYtTOEG1fnHZ23zBcYdRjnZ+oyAZd35iQeqOVShD2upmXl5RbJPm
         dnxz+yip746WDDjcSvSjljdf/eeZ5a+D6XLoK2t3AeP/LPv+cSz766D1T/9EZ/OICRHz
         IIRLj5dhjKVgywEK3CiF+9eVb/VPcyPprkeCruMavk7Cezd/JLUXTxnwWtOtfBvKY2UM
         M2+LItV/iZFY2ttpcTsoQfu/Kdaj16icwxMPysCGl4jmDEmFwJJ858gZ4t3wuPsDIXYX
         98IxLzZ8umYgGqNSRzy8P+8HbBY6xzdJf19QK2K46GZVMwfheqi8dRJlYE6K4q4GutjQ
         R7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011638; x=1772616438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xce9lXDzX6z1O07ZSxBwTpQMJv4vT6Yu3vRs6kQbfoQ=;
        b=SVmOr3efN1QGqZ717/eI5GS2zviRYGWv+Zk5LWtDrSy/LuopPiYh9NzQuK1shDxGBR
         uwnJ61fa42v+o1rNJhyCEnKvpEz+jIkTY1kWJ3kWQjxBcXx22fUxBo+GS9U6a95TItmp
         dBBNpX+Cv7EK8s5hwgtaT6UOUBk9WAfXzeirtKE0KJNIUDiqRFukpHO/HygEkhwxUlRp
         NZRoUJUuP3pzAJ3sWdh0QBKzW4arA39UfsHf50mGVLwz8QOA3u1J13KzZp6w/nS+Q2TF
         QLW3EvfZM5h9lwf7yzNVnDibdrNGXQMTkW2lum8NVMXlyjRB4v1O9JpA5VEnxd/osf6o
         dUnA==
X-Forwarded-Encrypted: i=1; AJvYcCXK9ubACqsr2XODyce1dMhCNYmH0rRryJVX2L5+5DoQm+7tyEY5ZxC2bKmfTVXFi5gIvXX7nrD7x2Za3XvUOfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaNbZjqCYMj6+kWWh/5gv7iNXY+3HfyvP9BdTJxlGvm4WXob7
	9QmQNWtKyGBanpOwkzKhctv0zC5SQD4DwizZ8nXPzIzoyOEKoVYjm59R
X-Gm-Gg: ATEYQzyJAf7vns/vxl6jsxkwNK7YaHRRzW4EFBvKSc0ETtJhIxtItXdx0WTX4r5PBOr
	eyHB/30gco0wquOTJotrOW92Ud4oWem+Q5LJ2ipHvTNLuq0e/rZkGcBC7ADIkuGp2viU3WkZHDt
	aZu1Uzx6ETfl6CsRnvzCP1YL1x2YudZx5cG2DgX2sMhTTDkxZ6rFfUm6HPNsQqpYZ4ztCUttk1i
	BAfAq8jK0CxWZ3sAfVONSSEHkBIqb2M8vPmZTfuxtWyI+WiiSj/9HT3vSDO7h0HzX1SvsxRBl6o
	FApK8gUri/YKyCUzj50H7DnXc0W5ayH3laJ3n9JuGQf7hmea0HYWbIjiziY2ixG2CYgeSxwRiBf
	a2myxw7Q9LoiuafIxCOpbrHGS4Sb90BOsAlZY3CNwTlxZz5zFwuutJ2ABTRc3bauRWwBWC2f3FL
	ow4/pm6N9KwyHiTjkp+Jez3FyKDoijyhSuGwhsC4lsfwKzGjaKRbC2kQ==
X-Received: by 2002:a17:90b:4a4c:b0:356:41c2:897e with SMTP id 98e67ed59e1d1-358ae7c31a4mr10841911a91.1.1772011637566;
        Wed, 25 Feb 2026 01:27:17 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm837901a91.1.2026.02.25.01.26.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Feb 2026 01:27:17 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	chengkaitao@kylinos.cn,
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] bpf: Extend the bpf_list family of APIs
Date: Wed, 25 Feb 2026 17:26:45 +0800
Message-ID: <20260225092651.94689-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

In BPF, a list can only be used to implement a stack structure.
Due to an incomplete API set, only FIFO or LIFO operations are
supported. The patches enhance the BPF list API, making it more
list-like.

Five new kfuncs have been added:
bpf_list_del: remove a node from the list
bpf_list_add_impl: insert a node after a given list node
bpf_list_is_first: check if a node is the first in the list
bpf_list_is_last: check if a node is the last in the list
bpf_list_empty: check if the list is empty

Changes in v2:
- Remove the head parameter from bpf_list_del
- Add bpf_list_add/is_first/is_last/empty to API and test cases

Link to v1:
https://lore.kernel.org/all/20260209025250.55750-1-pilgrimtao@gmail.com/

Kaitao Cheng (6):
  bpf: Introduce the bpf_list_del kfunc.
  selftests/bpf: Add test cases for bpf_list_del
  bpf: add bpf_list_add_impl to insert node after a given list node
  selftests/bpf: Add test case for bpf_list_add_impl
  bpf: add bpf_list_is_first/last/empty kfuncs
  selftests/bpf: Add test cases for bpf_list_is_first/is_last/empty

 kernel/bpf/btf.c                              | 33 ++++++-
 kernel/bpf/helpers.c                          | 92 +++++++++++++++++++
 kernel/bpf/verifier.c                         | 28 +++++-
 .../testing/selftests/bpf/bpf_experimental.h  | 38 ++++++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 87 ++++++++++++++++++
 5 files changed, 272 insertions(+), 6 deletions(-)

-- 
2.50.1 (Apple Git-155)

