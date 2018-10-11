From: gorcunov@gmail.com (Cyrill Gorcunov)
Date: Fri, 12 Oct 2018 00:02:56 +0300
Subject: [PATCH] proc: fix proc-self-map-files selftest for arm
In-Reply-To: <20181011205601.GA32757@avx2>
References: <20181011184359.15627-1-rafael.tinoco@linaro.org>
 <20181011205601.GA32757@avx2>
Message-ID: <20181011210256.GE2401@uranus.lan>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181011210256.L-ws8ckLnDiKGN8XgI-Dl2_jjhXCug3yZ9n6ZH4vbHw@z>

On Thu, Oct 11, 2018@11:56:01PM +0300, Alexey Dobriyan wrote:
> 
> As the comment in the beginning says this test is specifically for addresss 0.
> Maybe it should be ifdeffed with __arm__ then.

Is there some other reason than allocating non-mergable VMA?
