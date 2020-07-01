/*
 * Copyright 2019 Ververica GmbH
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.ververica.sqldemo.producer;

import com.ververica.sqldemo.producer.serde.Serializer;
import com.ververica.sqldemo.producer.records.TpchRecord;

import java.util.function.Consumer;

public class ConsolePrinter implements Consumer<TpchRecord> {

    private final Serializer serializer = new Serializer();

    @Override
    public void accept(TpchRecord record) {
        String jsonString = serializer.toString(record);
        System.out.println(jsonString);
    }
}
