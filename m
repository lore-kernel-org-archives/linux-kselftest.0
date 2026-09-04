Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8241D214
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 06:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502078; cv=none; b=m0Ts+I8mTV8g8n7Bey4DDXLVAlEeRc3kXd3mlKy/HLYVznf6afz+JIO32jaMLc+yemUegtXwXs58DRiRAzLAvs8Ddfb4vUx2V4tkncZu+9sS/+crcgt6sIbBNNv+OHXgd5Jr1/KJxj5Ji5R/KpIvx6XS19SmJJLPvJMrpkrOjnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502078; c=relaxed/simple;
	bh=eS+TwFxyuQDJqXHnp8bn/k1yAKU5y5vbImhUYOe1uDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHQwO1UOPQaaB+/0gIj6bJtgynSxnAE/MTJzIc7LBoA3j2b5I5lRn0X6/+nTmDlBIFAh6SV65XuNtHMX4BIbaSw9QX4I9LuWkDIAdmiQHqMOv0ajdUVihhJ/LPypNFi60HY/VX7MrHFJNNMEcD66+dPNx+lLgi4GScoIdrTAjv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K+XNHRuk; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K+XNHRuk"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eS+TwFxyuQDJqXHnp8bn/k1yAKU5y5vbImhUYOe1uDA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788502074; v=1; x=1789106874;
 b=K+XNHRukt4oyprgxrzLvhtKegLaVkDT3mC/HLvwcvUFt5ZVZfXDawh++RXnQTgRHx8RDzQiT
 cX5k7NgKjtkMpRnIlEUSKjac+h00j8vFJ0NJmsV4eQm181BdKhe88bFT+yyAAdc3sY2fK6kdPfz
 HAf0ifXp3MMGqtLnwYXs0YlI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 67aa2e91fa35fe53;
	Fri, 04 Sep 2026 06:07:54 +0000
X-Mizu-Trace-ID: 67aa2e91fa35fe53
X-Migadu-Flow: FLOW_OUT
Message-ID: <b965bb62-fcc8-4517-9947-24613650f1f5@linux.dev>
Date: Fri, 4 Sep 2026 14:07:49 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: Move verifier failure tests
 out of test_global_percpu_data
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Sid Nayyar <sidnayyar@google.com>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260904031912.2133476-1-tweek@google.com>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260904031912.2133476-1-tweek@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/9/26 11:19, Thiébaud Weksteen wrote:
> Commit 4c9241bd731a ("selftests/bpf: Add tests to verify global percpu
> data") added test_global_percpu_data.c to LSKELS_EXTRA. Later, in commit
> 1ed2294b31fc ("selftests/bpf: Test verifier log for global percpu data")
> two verifier failure tests were added (verifier_strncmp and
> verifier_snprintf), both marked as non-autoload (SEC("?kprobe")).
> 
> When bpftool generates light skeletons, non-autoloaded programs are
> skipped during loading, causing the loader program to store subsequent
> program FDs into incorrect skeleton struct fields (e.g. dump_percpu_data's
> FD was stored into verifier_strncmp's descriptor).

IIUC, patch 2 will fix the issue totally.

Better to add a subtest to verify both the issue and the fix?

Thanks,
Leon

> [...]

