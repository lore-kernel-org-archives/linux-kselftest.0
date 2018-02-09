From: dan.rue@linaro.org (Dan Rue)
Date: Fri, 9 Feb 2018 15:11:19 -0600
Subject: [Linux-kselftest-mirror] [kselftests] compaction_test is blocked
In-Reply-To: <700acd92-2b0b-d2da-615e-1f228708d216@cn.fujitsu.com>
References: <700acd92-2b0b-d2da-615e-1f228708d216@cn.fujitsu.com>
Message-ID: <20180209211119.xbch2eok6holyvel@xps>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180209211119.L_fS66DJ0oR7yaPua2LMb_4qDurWIsJ5JkpGmDxh4QE@z>

On Fri, Feb 09, 2018@03:53:59PM +0800, Li Zhijian wrote:
> Hi
> 
> kselftests is integrated Intel 0Day project.
> Sometimes we found compaction_test is blocked for more than 1 hours until i kill it.
> 
> Try to figure out where it is running, i added some log to this case.
> 
> the test log is like:
> -------------------
>  [  111.750543] main: 248
>  [  111.750544]-
>  [ 111.750821] check_compaction: 98
>  [  111.750822]-
>  [  111.751102] check_compaction: 105
>  [  111.751103]-
>  [  111.751362] check_compaction: 111
>  [  111.751363]-
>  [  111.751621] check_compaction: 118
>  [  111.751622]-
>  [  111.751879] check_compaction: 123
>  [  111.751880]-
> -------------------
> 118         fprintf(stderr, "%s: %d\n", __func__, __LINE__);
> 119         lseek(fd, 0, SEEK_SET);
> 120
> 121         /* Request a large number of huge pages. The Kernel will allocate
> 122            as much as it can */
> 123         fprintf(stderr, "%s: %d\n", __func__, __LINE__);         <<<======== the last line we can catch.
> 124         if (write(fd, "100000", (6*sizeof(char))) != (6*sizeof(char))) {        <<<<============ blocking position
> 125                 perror("Failed to write 100000 to /proc/sys/vm/nr_hugepages\n");
> 126                 goto close_fd;
> 127         }
> 128
> 129         lseek(fd, 0, SEEK_SET);
> 130
> 131         fprintf(stderr, "%s: %d\n", __func__, __LINE__);
> 132         if (read(fd, nr_hugepages, sizeof(nr_hugepages)) <= 0) {
> 133                 perror("Failed to re-read from /proc/sys/vm/nr_hugepages\n");
> 134                 goto close_fd;
> 135         }
> -------------------
> 
> According to above log and code, it most likely it is blocking at the writing operation.
> 
> my environment is like:
> OS: debian
> kernel: v4.15
> model: Ivytown Ivy Bridge-EP
> nr_cpu: 48
> memory: 64G

Hi Zhijian,

Please try this patch in mainline:

    4c1baad22390 kselftest: fix OOM in memory compaction test

Dan

> 
> 
> NOTE: 0Day can reproduce this issue in 20% on 0Day.
> 
> Anybody can help have a look?
> 
> Thanks
> Zhjian
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
