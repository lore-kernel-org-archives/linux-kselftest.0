From: ravi.bangoria@linux.vnet.ibm.com (Ravi Bangoria)
Date: Mon, 19 Mar 2018 13:29:59 +0530
Subject: [PATCH v6 21/21] perf-probe: Add array argument support
In-Reply-To: <152129118998.31874.16273532808298489908.stgit@devbox>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
 <152129118998.31874.16273532808298489908.stgit@devbox>
Message-ID: <8c02c538-4934-59c2-7795-9058ce57e625@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180319075959.GYHitO34zL8PbH6zJJ6xyt1si_ZlLb2YENdHZxeZHpE@z>

Hi Masami,

On 03/17/2018 06:23 PM, Masami Hiramatsu wrote:
> Since kprobes events support an array argument, perf-probe
> can also support dumping array now.
> The syntax are
>
>  <array-var>[<range>]
> or
>  <pointer-var>[<range>]
>
> where the <range> is <start>..<end>. e.g. array[0..5].
> This can also be available with string type. In this
> case, the string array should be "char *array[]" or
> "char **array_ptr".
>
> Note that this feature is only available on the kernel which
> supports array type.

User can still do,

# perf probe -x ~/hello main:3 'a=a:x32[3]'

which will successfully be installed in uprobe_events. But for a
perf tool, x32[3] is not a valid type. And it seems perf tool don't
validate the 'type' field:

    static int parse_perf_probe_arg(char *str, struct perf_probe_arg *arg)
    {
        ....
        tmp = strchr(str, ':');
        if (tmp) {      /* Type setting */
                *tmp = '\0';
                arg->type = strdup(tmp + 1);
                if (arg->type == NULL)
                        return -ENOMEM;
                pr_debug("type:%s ", arg->type);
        }

Is it okay to allow user to specify array size with type field?

Thanks,
Ravi

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
