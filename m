Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8941CD2C;
	Sun, 14 Jun 2026 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781432593; cv=none; b=ZkZ/WPjgGQoThBcLX+aI0FlKOQ0VRWkpIlvA4+aju7gqUGrGTUd5ESagK3qb1G1ekWN1+npGap+fHYlh1HRZFxkbwdr6JL65rjT/8oYCooDeNaW90l3ydfma2A3mheQGJ4ytIWjO0GgEDbHtzn9kbWY478iH8hnmxwfuTyJHkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781432593; c=relaxed/simple;
	bh=RuwEj2ihxdijHpW/9xxHXNSYgqpQTqjL9QJE6KcwM0k=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=J+umJEnEs1AEa8xfgnMZNXRwFZaT/cu7bksOqmZb3SPGqHSqVOLZ8JdMl2+DADtNHVGe1ggZk38m8X4gwFzUyIoc+/djeRxznCB6m5qanV89N4l5ABfcCE66qCJPT6EmBEkn84E2iqbJ2A9zEx08FNe5QRsyF/b/URkehqRgBXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ealqgkai; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ealqgkai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315241F000E9;
	Sun, 14 Jun 2026 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781432591;
	bh=3kqt2PsjkTRNbqmgv01YobweDN9fkjlj+b394Tb6Uu0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ealqgkai4qqTif1CDYIGqpuXKEUkZpWX1rrlTJZYqn4Gk8Nh8DDN3ub6KB02kVvZN
	 x4CAJMfzUv7VEeOzFAB3PtoQc3yYUD3HTwf4SHDYxCOPZiw39hIFVIG2P3LduzPW1O
	 pYj58K3ewGrckUmR6B+zCng2vz4C8k9AXgGN1kirbidHcnCW6EYXEC2qG151+cN8Q9
	 Eo4X70VM1fItupStDRQjHyA44R5N/eHuCNoMhHyDUFO5cGpMx5FaT15HKm76d04nK2
	 ab5dFLosIzV4tt0xcUzjbzAcIhNkjI2iCb2nblLkldnpZhYU+ABp9SfjlyB5tjMQwm
	 NbmQbN8BkBe5Q==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/3] selftests/kho: add LoongArch vmtest support
From: Mike Rapoport <rppt@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 George Guo <guodongtai@kylinos.cn>, WANG Xuerui <kernel@xen0n.name>, 
 Alexander Graf <graf@amazon.com>, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Kexin Liu <liukexin@kylinos.cn>
In-Reply-To: <20260601093930.112758-3-dongtai.guo@linux.dev>
References: <20260601092823.110362-1-dongtai.guo@linux.dev>
 <20260601093930.112758-1-dongtai.guo@linux.dev>
 <20260601093930.112758-3-dongtai.guo@linux.dev>
Date: Sun, 14 Jun 2026 13:23:03 +0300
Message-Id: <178143258399.2123877.4049283498071192411.b4-review@b4>
X-Mailer: b4 0.15.2

On Mon, 01 Jun 2026 17:39:30 +0800, George Guo <dongtai.guo@linux.dev> wrote:

Hi,

> Add loongarch.conf to configure QEMU's LoongArch virt machine with a

Please spell out "virtual machine" here and below or use VM abbrevation.

>
>
> diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
> index 49fdac8e8b15..918698b6dd2a 100755
> --- a/tools/testing/selftests/kho/vmtest.sh
> +++ b/tools/testing/selftests/kho/vmtest.sh
> @@ -107,12 +107,20 @@ function run_qemu() {
> [ ... skip 14 lines ... ]
> +		-kernel "$kernel"
> +		-initrd "$initrd"
> +	)
> +
> +	if [[ -n "${QEMU_TIMEOUT:-}" ]]; then
> +		timeout "$QEMU_TIMEOUT" $qemu_cmd "${qemu_args[@]}" || true

Runnig with timeout can be actually useful for other architecures. Let's
make a local variable for timeout of 120 seconds and always run qemu with timeout.

-- 
Sincerely yours,
Mike.

